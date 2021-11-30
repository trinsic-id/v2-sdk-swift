//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Okapi
import Proto
import GRPC;
import NIO;
import NIOHPACK
import SwiftProtobuf
import BLAKE3

public class Services {
    
    static func Account() -> ServiceBuilder<AccountService> {
        ServiceBuilder<AccountService>()
    }
    
    static func Wallet() -> ServiceBuilder<WalletService> {
        ServiceBuilder<WalletService>()
    }
    
    static func Credential() -> ServiceBuilder<CredentialService> {
        ServiceBuilder<CredentialService>()
    }
    
    static func TrustRegistry() -> ServiceBuilder<TrustRegistryService> {
        ServiceBuilder<TrustRegistryService>()
    }
}

protocol ServiceProfile {
    associatedtype Service
    var profile: Services_Account_V1_AccountProfile? { get }
    static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> Service
}

enum SdkError: Error {
    case profileNotSet
    case serverError(code: Int)
    case unknown
}
extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
extension Data {
    func toBase64URL() -> String {
        self.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}
extension ServiceProfile {
    func getMetadata(_ request: Message) throws -> CallOptions {
        
        guard let profile = self.profile else {
            throw SdkError.profileNotSet
        }
        
        let requestBytes = try request.serializedData()
        var requestHash = Data()
        
        if (requestBytes.count > 0)
        {
            requestHash = Data(BLAKE3.hash(requestBytes))
        }
        
        var nonce = Services_Common_V1_Nonce()
        nonce.requestHash = requestHash
        nonce.timestamp = Date().millisecondsSince1970
        
        NSLog("Timestamp: %@", nonce.timestamp.description)
        
        var proofRequest = Okapi_Security_V1_CreateOberonProofRequest()
        proofRequest.nonce = try nonce.serializedData()
        proofRequest.data = profile.authData
        proofRequest.token = profile.authToken
        
        let proof = try Oberon.createProof(request: proofRequest)
        
        var options = CallOptions()
        options.customMetadata.add(
            name: "Authorization",
            value: String(format: "Oberon ver=1,proof=%@,data=%@,nonce=%@",
                          proof.proof.toBase64URL(),
                          profile.authData.toBase64URL(),
                          try nonce.serializedData().toBase64URL()))
        
        return options
    }
}

class ServiceBuilder<T: ServiceProfile> {
    
    internal var endpoint = "prod.trincis.cloud"
    internal var port: UInt16 = 443
    internal var useTls = true
    
    internal var profile: Services_Account_V1_AccountProfile? = nil
    
    func build() -> T.Service {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let builder = self.useTls ?
            ClientConnection.usingPlatformAppropriateTLS(for: group) :
            ClientConnection.insecure(group: group)
        
        let channel = builder.connect(host: self.endpoint, port: Int(self.port))
        
        return T.create(channel: channel, profile: self.profile)
    }
    
    func with(endpoint: String) -> ServiceBuilder<T> {
        self.endpoint = endpoint
        return self
    }
    
    func with(port: UInt16) -> ServiceBuilder<T> {
        self.port = port
        return self
    }
    
    func with(useTls: Bool) -> ServiceBuilder<T> {
        self.useTls = useTls
        return self
    }
    
    func with(profile: Services_Account_V1_AccountProfile) -> ServiceBuilder<T> {
        self.profile = profile
        return self
    }
}
