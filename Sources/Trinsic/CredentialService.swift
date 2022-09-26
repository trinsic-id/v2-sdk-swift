//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class CredentialService: ServiceBase {
    var client: Services_Verifiablecredentials_V1_VerifiableCredentialClient?

    public init() {
        super.init(options: Sdk_Options_V1_ServiceOptions())
        client = Services_Verifiablecredentials_V1_VerifiableCredentialClient(channel: createChannel())
    }

    override public init(options: Sdk_Options_V1_ServiceOptions) {
        super.init(options: options)
        client = Services_Verifiablecredentials_V1_VerifiableCredentialClient(channel: createChannel())
    }

    // BEGIN Code generated by protoc-gen-trinsic. DO NOT EDIT.
    // target: C:\work\sdk-swift\Sources\Trinsic\CredentialService.swift

    public func issue(request: Services_Verifiablecredentials_V1_IssueRequest) throws -> Services_Verifiablecredentials_V1_IssueResponse {
        return try client!.Issue(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func issueFromTemplate(request: Services_Verifiablecredentials_V1_IssueFromTemplateRequest) throws -> Services_Verifiablecredentials_V1_IssueFromTemplateResponse {
        return try client!.IssueFromTemplate(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func checkStatus(request: Services_Verifiablecredentials_V1_CheckStatusRequest) throws -> Services_Verifiablecredentials_V1_CheckStatusResponse {
        return try client!.CheckStatus(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func updateStatus(request: Services_Verifiablecredentials_V1_UpdateStatusRequest) throws -> Services_Verifiablecredentials_V1_UpdateStatusResponse {
        return try client!.UpdateStatus(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func createProof(request: Services_Verifiablecredentials_V1_CreateProofRequest) throws -> Services_Verifiablecredentials_V1_CreateProofResponse {
        return try client!.CreateProof(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func verifyProof(request: Services_Verifiablecredentials_V1_VerifyProofRequest) throws -> Services_Verifiablecredentials_V1_VerifyProofResponse {
        return try client!.VerifyProof(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }

    public func send(request: Services_Verifiablecredentials_V1_SendRequest) throws -> Services_Verifiablecredentials_V1_SendResponse {
        return try client!.Send(request, callOptions: try buildMetadata(request))
            .response
            .wait()
    }
    // END Code generated by protoc-gen-trinsic. DO NOT EDIT.
}
