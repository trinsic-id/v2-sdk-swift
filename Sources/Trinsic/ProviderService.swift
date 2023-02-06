//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class ProviderService: ServiceBase {
    var client: Services_Provider_V1_ProviderNIOClient?

    public init() {
        super.init(options: Sdk_Options_V1_ServiceOptions())
        client = Services_Provider_V1_ProviderNIOClient(channel: createChannel())
    }

    override public init(options: Sdk_Options_V1_ServiceOptions) {
        super.init(options: options)
        client = Services_Provider_V1_ProviderNIOClient(channel: createChannel())
    }

    public func createEcosystem(request: Services_Provider_V1_CreateEcosystemRequest) throws -> Services_Provider_V1_CreateEcosystemResponse {
        if !request.name.isEmpty || (request.hasDetails && !request.details.email.isEmpty) {
            return try client!.CreateEcosystem(request, callOptions: try buildMetadata(request))
                .response
                .wait()
        } else {
            return try client!.CreateEcosystem(request).response.wait()
        }
    }

    // BEGIN Code generated by protoc-gen-trinsic. DO NOT EDIT.
    // target: /Users/scott/Documents/GitHub/sdk-swift/Sources/Trinsic/ProviderService.swift

    @available(*, deprecated, message: "This will be removed May 1, 2023")
    public func updateEcosystem(request: Services_Provider_V1_UpdateEcosystemRequest) throws -> Services_Provider_V1_UpdateEcosystemResponse {
        try client!.UpdateEcosystem(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func addWebhook(request: Services_Provider_V1_AddWebhookRequest) throws -> Services_Provider_V1_AddWebhookResponse {
        try client!.AddWebhook(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func deleteWebhook(request: Services_Provider_V1_DeleteWebhookRequest) throws -> Services_Provider_V1_DeleteWebhookResponse {
        try client!.DeleteWebhook(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func ecosystemInfo(request: Services_Provider_V1_EcosystemInfoRequest) throws -> Services_Provider_V1_EcosystemInfoResponse {
        try client!.EcosystemInfo(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    @available(*, deprecated, message: "This will be removed May 1, 2023")
    public func getPublicEcosystemInfo(request: Services_Provider_V1_GetPublicEcosystemInfoRequest) throws -> Services_Provider_V1_GetPublicEcosystemInfoResponse {
        try client!.GetPublicEcosystemInfo(request, callOptions: try buildMetadata(nil))
            .response
            .wait()
    }

    public func getOberonKey(request: Services_Provider_V1_GetOberonKeyRequest) throws -> Services_Provider_V1_GetOberonKeyResponse {
        try client!.GetOberonKey(request, callOptions: try buildMetadata(nil))
            .response
            .wait()
    }

    public func upgradeDID(request: Services_Provider_V1_UpgradeDidRequest) throws -> Services_Provider_V1_UpgradeDidResponse {
        try client!.UpgradeDID(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func retrieveDomainVerificationRecord(request: Services_Provider_V1_RetrieveDomainVerificationRecordRequest) throws -> Services_Provider_V1_RetrieveDomainVerificationRecordResponse {
        try client!.RetrieveDomainVerificationRecord(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func refreshDomainVerificationStatus(request: Services_Provider_V1_RefreshDomainVerificationStatusRequest) throws -> Services_Provider_V1_RefreshDomainVerificationStatusResponse {
        try client!.RefreshDomainVerificationStatus(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func searchWalletConfigurations(request: Services_Provider_V1_SearchWalletConfigurationsRequest) throws -> Services_Provider_V1_SearchWalletConfigurationResponse {
        try client!.SearchWalletConfigurations(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    // END Code generated by protoc-gen-trinsic. DO NOT EDIT.
}
