//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import GRPC

public class TrustRegistryService
{
    var profile: Services_Account_V1_AccountProfile?
    var client: Services_Trustregistry_V1_TrustRegistryClient

    private init (client: Services_Trustregistry_V1_TrustRegistryClient) {
        self.client = client
    }
}

extension TrustRegistryService : ServiceProfile {
    typealias Service = TrustRegistryService
    
    internal static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> TrustRegistryService {
        TrustRegistryService(client: Services_Trustregistry_V1_TrustRegistryClient(channel: channel))
    }
}
