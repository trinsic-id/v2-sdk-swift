//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import GRPC

public class AccountService {
    var profile: Services_Account_V1_AccountProfile?
    var client: Services_Account_V1_AccountClient

    private init (client: Services_Account_V1_AccountClient) {
        self.client = client
    }
    
    func signIn() throws -> Services_Account_V1_AccountProfile {
        let response = try client.SignIn(Services_Account_V1_SignInRequest())
            .response.wait()
        
        return response.profile
    }
    
    func info() throws -> Services_Account_V1_InfoResponse {
        let request = Services_Account_V1_InfoRequest()
        let response = try client.Info(request, callOptions: getMetadata(request))
            .response.wait()
        
        return response
    }
}

extension AccountService: ServiceProfile {
    typealias Service = AccountService
    
    internal static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> AccountService {
        AccountService(client: Services_Account_V1_AccountClient(channel: channel))
    }
}
