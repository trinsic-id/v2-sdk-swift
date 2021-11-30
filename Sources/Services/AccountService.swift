//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto

public class AccountService: Service {
    var client: Services_Account_V1_AccountClient?
    
    required init(config: Config) {
        self.client = nil
        super.init(config: config)
        
        self.client = Services_Account_V1_AccountClient(channel: channel)
    }

    func signIn() throws -> Services_Account_V1_AccountProfile {
        let response = try client!.SignIn(Services_Account_V1_SignInRequest())
            .response.wait()
        
        return response.profile
    }
    
    func info() throws -> Services_Account_V1_InfoResponse {
        let response = try client!.Info(Services_Account_V1_InfoRequest(),
                                        callOptions: super.callOptions())
            .response.wait()
        
        return response
    }
}
