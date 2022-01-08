//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class ProviderService
{
    public private(set) var profile: Services_Account_V1_AccountProfile?
    var client: Services_Provider_V1_ProviderClient

    private init (client: Services_Provider_V1_ProviderClient) {
        self.client = client
    }
    
    public func createEcosystem(request: Services_Provider_V1_CreateEcosystemRequest) throws -> Services_Provider_V1_CreateEcosystemResponse {
            let result = try client.CreateEcosystem(request, callOptions: getMetadata(request))
                .response
                .wait()
            
            return result
    }
    
    public func listEcosystems(request: Services_Provider_V1_ListEcosystemsRequest) throws -> Services_Provider_V1_ListEcosystemsResponse {
            let result = try client.ListEcosystems(request, callOptions: getMetadata(request))
                .response
                .wait()
            
            return result
    }
}

extension ProviderService : ServiceProfile {
    public typealias TService = ProviderService
    
    public static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> ProviderService {
        let service = ProviderService(client: Services_Provider_V1_ProviderClient(channel: channel))
        service.profile = profile
        
        return service
    }
}
