//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import GRPC

public class ProviderService
{
    var profile: Services_Account_V1_AccountProfile?
    var client: Services_Provider_V1_ProviderClient

    private init (client: Services_Provider_V1_ProviderClient) {
        self.client = client
    }
}

extension ProviderService : ServiceProfile {
    typealias Service = ProviderService
    
    internal static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> ProviderService {
        ProviderService(client: Services_Provider_V1_ProviderClient(channel: channel))
    }
}
