//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public typealias AccountProfile = Services_Account_V1_AccountProfile

public class AccountService: ServiceBase {
    var client: Services_Account_V1_AccountClient?

    public init() {
        super.init(options: Sdk_Options_V1_ServiceOptions())
        client = Services_Account_V1_AccountClient(channel: createChannel())
    }

    override public init(options: Sdk_Options_V1_ServiceOptions) {
        super.init(options: options)
        client = Services_Account_V1_AccountClient(channel: createChannel())
    }

    public func signIn(request: Services_Account_V1_SignInRequest) throws -> String {
        var requestCopy = Services_Account_V1_SignInRequest()
        requestCopy.ecosystemID = request.ecosystemID
        requestCopy.details = request.details
        requestCopy.invitationCode = request.invitationCode

        if requestCopy.ecosystemID.isEmpty {
            requestCopy.ecosystemID = options.defaultEcosystem
        }
        let response = try client!.SignIn(requestCopy)
            .response
            .wait()

        let authToken = (try response.profile.serializedData()).base64EncodedString()
        if response.profile.hasProtection, !response.profile.protection.enabled {
            options.authToken = authToken
        }

        return authToken
    }

    public func info(request: Services_Account_V1_AccountInfoRequest) throws -> Services_Account_V1_AccountInfoResponse {
        let response = try client!.Info(request, callOptions: try buildMetadata(request))
            .response.wait()

        return response
    }
    
    public func login(request: Services_Account_V1_LoginRequest) throws -> Services_Account_V1_LoginResponse {
        let response = try client!.Login(request, callOptions: try buildMetadata(request))
            .response.wait()

        return response
    }
    
    public func loginConfirm(request: Services_Account_V1_LoginConfirmRequest) throws -> Services_Account_V1_LoginConfirmResponse {
        let response = try client!.LoginConfirm(request, callOptions: try buildMetadata(request))
            .response.wait()

        return response
    }
}
