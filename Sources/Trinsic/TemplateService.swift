//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 1/8/22.
//

import Foundation
import GRPC

public class TemplateService
{
    public private(set) var profile: Services_Account_V1_AccountProfile?
    var client: Services_Verifiablecredentials_Templates_V1_CredentialTemplatesClient

    private init (client: Services_Verifiablecredentials_Templates_V1_CredentialTemplatesClient) {
        self.client = client
    }
    
    public func create(request: Services_Verifiablecredentials_Templates_V1_CreateCredentialTemplateRequest) throws -> Services_Verifiablecredentials_Templates_V1_CreateCredentialTemplateResponse {
        let result = try client.Create(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func get(request: Services_Verifiablecredentials_Templates_V1_GetCredentialTemplateRequest) throws -> Services_Verifiablecredentials_Templates_V1_GetCredentialTemplateResponse {
        let result = try client.Get(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func list(request: inout Services_Verifiablecredentials_Templates_V1_ListCredentialTemplatesRequest) throws -> Services_Verifiablecredentials_Templates_V1_ListCredentialTemplatesResponse {
        if request.query.isEmpty {
            request.query = "SELECT * FROM c"
        }
        let result = try client.List(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func search(request: inout Services_Verifiablecredentials_Templates_V1_SearchCredentialTemplatesRequest) throws -> Services_Verifiablecredentials_Templates_V1_SearchCredentialTemplatesResponse {
        if request.query.isEmpty {
            request.query = "SELECT * FROM c"
        }
        let result = try client.Search(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
    
    public func delete(request: Services_Verifiablecredentials_Templates_V1_DeleteCredentialTemplateRequest) throws -> Services_Verifiablecredentials_Templates_V1_DeleteCredentialTemplateResponse {
        let result = try client.Delete(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result
    }
}


extension TemplateService : ServiceProfile {
    public typealias TService = TemplateService
    
    public static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> TemplateService {
        let service = TemplateService(client: Services_Verifiablecredentials_Templates_V1_CredentialTemplatesClient(channel: channel))
        service.profile = profile
        
        return service
    }
}
