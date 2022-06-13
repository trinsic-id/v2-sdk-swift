//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class ProviderService: ServiceBase {
    var client: Services_Provider_V1_ProviderClient?

    public init() {
        super.init(options: Sdk_Options_V1_ServiceOptions())
        client = Services_Provider_V1_ProviderClient(channel: createChannel())
    }

    override public init(options: Sdk_Options_V1_ServiceOptions) {
        super.init(options: options)
        client = Services_Provider_V1_ProviderClient(channel: createChannel())
    }

    public func createEcosystem(request: Services_Provider_V1_CreateEcosystemRequest) throws -> Services_Provider_V1_CreateEcosystemResponse {
        return try client!.CreateEcosystem(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
}
