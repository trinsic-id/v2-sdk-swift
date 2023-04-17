//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC
import NIO
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
        metadataOptions.customMetadata.add(name: "TrinsicSDKLanguage", value: "swift")
        metadataOptions.customMetadata.add(name: "TrinsicSDKVersion", value: getSDKVersion())
        if request != nil {
            try metadataOptions.customMetadata.add(
                name: "Authorization",
                value: String(format: "Bearer %@", options.authToken ?? "")
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
