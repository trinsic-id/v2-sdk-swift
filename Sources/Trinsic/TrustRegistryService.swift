//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class TrustRegistryService : ServiceBase {
    var client: Services_Trustregistry_V1_TrustRegistryClient?

    public init () {
        super.init(options: Sdk_Options_V1_ServiceOptions())
        client = Services_Trustregistry_V1_TrustRegistryClient(channel: createChannel())
    }
    public override init (options: Sdk_Options_V1_ServiceOptions) {
        super.init(options: options)
        client = Services_Trustregistry_V1_TrustRegistryClient(channel: createChannel())
    }
    
    public func addFramework(request: Services_Trustregistry_V1_AddFrameworkRequest) throws -> Services_Trustregistry_V1_AddFrameworkResponse {
        return try client!.AddFramework(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func removeFramework(request: Services_Trustregistry_V1_RemoveFrameworkRequest) throws -> Services_Trustregistry_V1_RemoveFrameworkResponse {
        return try client!.RemoveFramework(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func registerIssuer(request: Services_Trustregistry_V1_RegisterIssuerRequest) throws -> Services_Trustregistry_V1_RegisterIssuerResponse {
        return try client!.RegisterIssuer(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func registerVerifier(request: Services_Trustregistry_V1_RegisterVerifierRequest) throws -> Services_Trustregistry_V1_RegisterVerifierResponse {
        return try client!.RegisterVerifier(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func unregisterIssuer(request: Services_Trustregistry_V1_UnregisterIssuerRequest) throws -> Services_Trustregistry_V1_UnregisterIssuerResponse {
        return try client!.UnregisterIssuer(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func unregisterVerifier(request: Services_Trustregistry_V1_UnregisterVerifierRequest) throws -> Services_Trustregistry_V1_UnregisterVerifierResponse {
        return try client!.UnregisterVerifier(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func checkIssuerStatus(request: Services_Trustregistry_V1_CheckIssuerStatusRequest) throws -> Services_Trustregistry_V1_CheckIssuerStatusResponse {
        return try client!.CheckIssuerStatus(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func checkVerifierStatus(request: Services_Trustregistry_V1_CheckVerifierStatusRequest) throws -> Services_Trustregistry_V1_CheckVerifierStatusResponse {
        return try client!.CheckVerifierStatus(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    
    public func searchRegistry(request: Services_Trustregistry_V1_SearchRegistryRequest) throws -> Services_Trustregistry_V1_SearchRegistryResponse {
        return try client!.SearchRegistry(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
}

