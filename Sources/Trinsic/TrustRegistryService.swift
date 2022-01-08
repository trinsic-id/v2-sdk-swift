//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class TrustRegistryService {
    public private(set) var profile: Services_Account_V1_AccountProfile?
    var client: Services_Trustregistry_V1_TrustRegistryClient

    private init (client: Services_Trustregistry_V1_TrustRegistryClient) {
        self.client = client
    }
    
    public func addFramework(request: Services_Trustregistry_V1_AddFrameworkRequest) throws -> Services_Trustregistry_V1_AddFrameworkResponse {
        let result = try client.AddFramework(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func registerIssuer(request: Services_Trustregistry_V1_RegisterIssuerRequest) throws -> Services_Trustregistry_V1_RegisterIssuerResponse {
        let result = try client.RegisterIssuer(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func registerVerifier(request: Services_Trustregistry_V1_RegisterVerifierRequest) throws -> Services_Trustregistry_V1_RegisterVerifierResponse {
        let result = try client.RegisterVerifier(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func unregisterIssuer(request: Services_Trustregistry_V1_UnregisterIssuerRequest) throws -> Services_Trustregistry_V1_UnregisterIssuerResponse {
        let result = try client.UnregisterIssuer(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func unregisterVerifier(request: Services_Trustregistry_V1_UnregisterVerifierRequest) throws -> Services_Trustregistry_V1_UnregisterVerifierResponse {
        let result = try client.UnregisterVerifier(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func checkIssuerStatus(request: Services_Trustregistry_V1_CheckIssuerStatusRequest) throws -> Services_Trustregistry_V1_CheckIssuerStatusResponse {
        let result = try client.CheckIssuerStatus(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func checkVerifierStatus(request: Services_Trustregistry_V1_CheckVerifierStatusRequest) throws -> Services_Trustregistry_V1_CheckVerifierStatusResponse {
        let result = try client.CheckVerifierStatus(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func searchRegistry(query: String = "SELECT * from c") throws -> Services_Trustregistry_V1_SearchRegistryResponse {
        var request = Services_Trustregistry_V1_SearchRegistryRequest()
        request.query = query
        request.options = Services_Common_V1_RequestOptions()
        request.options.responseJsonFormat = .binary
        
        let result = try client.SearchRegistry(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
}

extension TrustRegistryService: ServiceProfile {
    public typealias TService = TrustRegistryService
    
    public static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> TrustRegistryService {
        let service = TrustRegistryService(client: Services_Trustregistry_V1_TrustRegistryClient(channel: channel))
        service.profile = profile
        
        return service
    }
}
