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
    public var profile: Services_Account_V1_AccountProfile?
    var client: Services_Provider_V1_ProviderClient

    private init (client: Services_Provider_V1_ProviderClient) {
        self.client = client
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
