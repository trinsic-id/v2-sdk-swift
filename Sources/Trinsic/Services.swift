//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC
import NIO
import Okapi
import SwiftProtobuf

public class ServiceBase {
    public var options: Sdk_Options_V1_ServiceOptions

    public init(options: Sdk_Options_V1_ServiceOptions) {
        self.options = options

        if self.options.serverEndpoint.isEmpty {
            self.options.serverEndpoint = "prod.trinsic.cloud"
            self.options.serverUseTls = true
        }

        if self.options.serverPort == 0 {
            self.options.serverPort = 443
        }

        if self.options.serverPort == 443 {
            self.options.serverUseTls = true
        }
    }

    internal func setAuthToken(token: String) {
        options.authToken = token
    }

    internal func createChannel() -> GRPCChannel {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 10)
        let builder = options.serverUseTls ?
            ClientConnection.usingPlatformAppropriateTLS(for: group) :
            ClientConnection.insecure(group: group)

        return builder.connect(host: options.serverEndpoint, port: Int(options.serverPort))
    }

    internal func getSDKVersion() -> String {
        let version = "1.7.0"
        return version
    }

    internal func buildMetadata(_ request: Message?) throws -> CallOptions {
        var metadataOptions = CallOptions()
        try metadataOptions.customMetadata.add(name: "TrinsicOkapiVersion", value: Okapi.Metadata.getMetadata(request: Okapi_Metadata_MetadataRequest()).version)
        metadataOptions.customMetadata.add(name: "TrinsicSDKLanguage", value: "swift")
        // TODO: - Embed swift version const somewhere, it isn't uniformly recorded
        metadataOptions.customMetadata.add(name: "TrinsicSDKVersion", value: getSDKVersion())
        if request != nil {
            if options.authToken.isEmpty {
                throw SdkError.authTokenNotSet
            }
            let profile = try Services_Account_V1_AccountProfile(serializedData: Data(base64Encoded: options.authToken)!)

            let requestBytes = try request!.serializedData()
            var requestHash = Data()

            if requestBytes.count > 0 {
                var hashRequest = Okapi_Hashing_V1_Blake3HashRequest()
                hashRequest.data = requestBytes
                let hashResponse = try Hashing.Blake3Hash(request: hashRequest)

                requestHash = hashResponse.digest
            }

            var nonce = Services_Common_V1_Nonce()
            nonce.requestHash = requestHash
            nonce.timestamp = Date().millisecondsSince1970

            var proofRequest = Okapi_Security_V1_CreateOberonProofRequest()
            proofRequest.nonce = try nonce.serializedData()
            proofRequest.data = profile.authData
            proofRequest.token = profile.authToken

            let proof = try Oberon.createProof(request: proofRequest)

            try metadataOptions.customMetadata.add(
                name: "Authorization",
                value: String(format: "Oberon ver=1,proof=%@,data=%@,nonce=%@",
                              proof.proof.toBase64URL(),
                              profile.authData.toBase64URL(),
                              nonce.serializedData().toBase64URL())
            )
        }
        return metadataOptions
    }
}

public enum SdkError: Error {
    case authTokenNotSet
    case serverError(code: Int)
    case unknown
    case noProfileReturned
    case profileProtected
}
