//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import GRPC

public class CredentialService
{
    var profile: Services_Account_V1_AccountProfile?
    var client: Services_Verifiablecredentials_V1_VerifiableCredentialClient

    private init (client: Services_Verifiablecredentials_V1_VerifiableCredentialClient) {
        self.client = client
    }
}

extension CredentialService : ServiceProfile {
    typealias Service = CredentialService
    
    internal static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> CredentialService {
        CredentialService(client: Services_Verifiablecredentials_V1_VerifiableCredentialClient(channel: channel))
    }
}
