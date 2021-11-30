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

extension ServiceProfile {
    func getMetadata(_ request: Message) throws -> CallOptions {
        var options = CallOptions()
        options.customMetadata.add(name: "Authorization", value: "TODO")
        
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
