//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import GRPC

public class WalletService
{
    var profile: Services_Account_V1_AccountProfile?
    var client: Services_Universalwallet_V1_UniversalWalletClient

    private init (client: Services_Universalwallet_V1_UniversalWalletClient) {
        self.client = client
    }
}

extension WalletService : ServiceProfile {
    typealias Service = WalletService
    
    internal static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> WalletService {
        WalletService(client: Services_Universalwallet_V1_UniversalWalletClient(channel: channel))
    }
}
