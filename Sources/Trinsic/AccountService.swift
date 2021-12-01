//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC


public typealias AccountProfile = Services_Account_V1_AccountProfile

public class AccountService {
    public private(set) var profile: AccountProfile?
    var client: Services_Account_V1_AccountClient

    private init (client: Services_Account_V1_AccountClient) {
        self.client = client
    }
    
    public func signIn() throws -> AccountProfile {
        let response = try client.SignIn(Services_Account_V1_SignInRequest())
            .response.wait()
        
        return response.profile
    }
    
    public func info() throws -> Services_Account_V1_InfoResponse {
        let request = Services_Account_V1_InfoRequest()
        let response = try client.Info(request, callOptions: getMetadata(request))
            .response.wait()
        
        return response
    }
}

extension AccountService: ServiceProfile {
    public typealias TService = AccountService
    
    public static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> AccountService {
        let service = AccountService(client: Services_Account_V1_AccountClient(channel: channel))
        service.profile = profile
        
        return service
    }
}
