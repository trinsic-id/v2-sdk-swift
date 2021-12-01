//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC

public class CredentialService
{
    public var profile: Services_Account_V1_AccountProfile?
    var client: Services_Verifiablecredentials_V1_VerifiableCredentialClient

    private init (client: Services_Verifiablecredentials_V1_VerifiableCredentialClient) {
        self.client = client
    }
    
    func issue(document: [String: Any]) throws -> [String: Any] {
        var request = Services_Verifiablecredentials_V1_IssueRequest()
        request.document = Services_Common_V1_JsonPayload()
        request.document.jsonBytes = try JSONSerialization.data(
            withJSONObject: document,
            options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let response = try client.Issue(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return try JSONSerialization.jsonObject(
            with: response.document.jsonBytes,
            options: [])
        as! [String: Any]
    }
    
    func send(document: [String: Any], email: String) throws {
        var request = Services_Verifiablecredentials_V1_SendRequest();
        request.email = email;
        request.document = Services_Common_V1_JsonPayload();
        request.document.jsonBytes = try JSONSerialization.data(
            withJSONObject: document,
            options: JSONSerialization.WritingOptions.prettyPrinted)
        
        _ = try client.Send(request, callOptions: getMetadata(request))
            .response
            .wait();
    }

    func createProof(documentId: String, revealDocument: [String: Any]) throws -> [String: Any] {
        var request = Services_Verifiablecredentials_V1_CreateProofRequest();
        request.documentID = documentId;
        request.revealDocument = Services_Common_V1_JsonPayload();
        request.revealDocument.jsonBytes = try JSONSerialization.data(
            withJSONObject: revealDocument,
            options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let result = try client.CreateProof(request, callOptions: getMetadata(request))
            .response
            .wait()
        return try JSONSerialization.jsonObject(with: result.proofDocument.jsonBytes, options: []) as! [String: Any];
    }

    func verify(proofDocument: [String: Any]) throws -> Bool {
        var request = Services_Verifiablecredentials_V1_VerifyProofRequest();
        request.proofDocument = Services_Common_V1_JsonPayload();
        request.proofDocument.jsonBytes = try JSONSerialization.data(
            withJSONObject: proofDocument,
            options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let result = try client.VerifyProof(request, callOptions: getMetadata(request))
            .response
            .wait()
        
        return result.valid;
    }
}

extension CredentialService : ServiceProfile {
    public typealias TService = CredentialService
    
    public static func create(channel: GRPCChannel, profile: Services_Account_V1_AccountProfile?) -> CredentialService {
        let service = CredentialService(client: Services_Verifiablecredentials_V1_VerifiableCredentialClient(channel: channel))
        service.profile = profile
        
        return service
    }
}
