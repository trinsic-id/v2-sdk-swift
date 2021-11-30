//import Foundation;
//import SwiftProtobuf;
//import Okapi;
//import GRPC;
//import NIO;
//import NIOHPACK
//
//enum TrinsicError :Error {
//    case profileNotSet
//    case httpsNotImplemented
//    case portNotSpecified
//    case urlNotParsed
//}
//
//class ServiceBase {
//    var capInvocation: String = "";
//
//    func getMetadata() throws -> [String: String] {
//        if capInvocation == "" {
//            throw TrinsicError.profileNotSet;
//        }
//        return ["capability-invocation": self.capInvocation];
//    }
//    func getCallOptions() throws -> CallOptions {
//        CallOptions(customMetadata: HPACKHeaders([("capability-invocation", self.capInvocation)]))
//    }
//
//    func setProfile(profile: Trinsic_Services_WalletProfile) throws {
//        let capabilityDictionary = [
//            "@context": Google_Protobuf_Value(stringValue:"https://w3id.org/security/v2"),
//            "invocationTarget": Google_Protobuf_Value(stringValue:profile.walletID),
//            "proof": Google_Protobuf_Value(structValue: Google_Protobuf_Struct(fields:[
//                "proofPurpose": Google_Protobuf_Value(stringValue:"capabilityInvocation"),
//              "created": Google_Protobuf_Value(stringValue:ISO8601DateFormatter().string(from: Date())),
//                "capability": Google_Protobuf_Value(stringValue:profile.capability)
//            ])),
//        ] as [String: Google_Protobuf_Value];
//
//        var proofRequest = Okapi_Proofs_V1_CreateProofRequest();
//        proofRequest.key = try Okapi_Keys_V1_JsonWebKey(serializedData: profile.invokerJwk);
//        proofRequest.document = Google_Protobuf_Struct(fields: capabilityDictionary);
//        let proofResponse = try LdProofs.createProof(request: proofRequest);
//        let proofJson = try proofResponse.signedDocument.jsonUTF8Data();
//        capInvocation = proofJson.base64EncodedString();
//    }
//
//    public static func createAndVerifyUrl(serviceAddress: String) throws -> URL {
//        let url = URL(string: serviceAddress);
//        if url == nil {
//            throw TrinsicError.urlNotParsed
//        }
//        if url?.scheme == "https" {
//            throw TrinsicError.httpsNotImplemented
//        }
//        if url?.port == nil {
//            throw TrinsicError.portNotSpecified
//        }
//        return url!
//    }
//}
//
//class WalletService : ServiceBase {
//    var credentialClient: Trinsic_Services_CredentialClient;
//    var walletClient: Trinsic_Services_WalletClient;
//    init(serviceAddress: String = "http://localhost:5000") throws {
//        let url = try ServiceBase.createAndVerifyUrl(serviceAddress: serviceAddress)
//
//        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1);
//        let channel = ClientConnection.insecure(group: group).connect(host: url.host!, port: url.port!);
//        credentialClient = Trinsic_Services_CredentialClient(channel: channel);
//        walletClient = Trinsic_Services_WalletClient(channel: channel);
//    }
//
//    func registerOrConnect(email: String) async throws {
//        var request = Trinsic_Services_ConnectRequest();
//        request.email = email;
//        try await walletClient.connectExternalIdentity(request).response;
//    }
//
//    func createWallet(securityCode: String = "") async throws -> Trinsic_Services_WalletProfile {
//        var myKeyRequest = Okapi_Keys_GenerateKeyRequest();
//        myKeyRequest.keyType = Okapi_Keys_KeyType.ed25519;
//        let myKeyResponse = try DidKey.generate(request: myKeyRequest);
//        let myDidDocument = myKeyResponse.didDocument.fields;
//
//        var createWalletRequest = Trinsic_Services_CreateWalletRequest();
//        createWalletRequest.controller = myDidDocument["id"]!.stringValue;
//        createWalletRequest.securityCode = securityCode;
//
//        let response = try await walletClient.createWallet(createWalletRequest).response;
//
//        var payload = Trinsic_Services_JsonPayload();
//        payload.jsonString = try myKeyResponse.didDocument.jsonString();
//
//        var walletProfile = Trinsic_Services_WalletProfile();
//        walletProfile.walletID = response.walletID;
//        walletProfile.capability = response.capability;
//        walletProfile.didDocument = payload;
//        walletProfile.invoker = response.invoker;
//        walletProfile.invokerJwk = try myKeyResponse.key[0].serializedData();
//
//        return walletProfile;
//    }
//
//    func issueCredential(document: [String: Any]) async throws -> [String: Any] {
//        var issueRequest = Trinsic_Services_IssueRequest();
//        issueRequest.document = Trinsic_Services_JsonPayload();
//        issueRequest.document.jsonString = String(decoding: try JSONSerialization.data(withJSONObject: document, options: JSONSerialization.WritingOptions.prettyPrinted), as: UTF8.self);
//        let response = try await credentialClient.issue(issueRequest, callOptions: getCallOptions()).response;
//        return (try JSONSerialization.jsonObject(with: response.document.jsonString.data(using: .utf8)!, options: [])) as! [String: Any];
//    }
//
//    func send(document: [String: Any], email: String) async throws {
//        var sendRequest = Trinsic_Services_SendRequest();
//        sendRequest.email = email;
//        sendRequest.document = Trinsic_Services_JsonPayload();
//        sendRequest.document.jsonString = String(decoding: try JSONSerialization.data(withJSONObject: document, options: JSONSerialization.WritingOptions.prettyPrinted), as: UTF8.self);
//        try await credentialClient.send(sendRequest, callOptions: getCallOptions()).response;
//    }
//
//    func createProof(documentId: String, revealDocument: [String: Any]) async throws -> [String: Any] {
//        var request = Trinsic_Services_CreateProofRequest();
//        request.documentID = documentId;
//        request.revealDocument = Trinsic_Services_JsonPayload();
//        request.revealDocument.jsonString = String(decoding:try JSONSerialization.data(withJSONObject: revealDocument, options: JSONSerialization.WritingOptions.prettyPrinted), as: UTF8.self);
//        let result = (try await credentialClient.createProof(request, callOptions: getCallOptions()).response);
//        return (try JSONSerialization.jsonObject(with: result.proofDocument.jsonString.data(using: .utf8)!, options: [])) as! [String: Any];
//    }
//
//    func verifyProof(proofDocument: [String: Any]) async throws -> Bool {
//        var request = Trinsic_Services_VerifyProofRequest();
//        request.proofDocument = Trinsic_Services_JsonPayload();
//        request.proofDocument.jsonString = String(decoding:try JSONSerialization.data(withJSONObject: proofDocument, options: JSONSerialization.WritingOptions.prettyPrinted), as: UTF8.self);
//        let result = try credentialClient.verifyProof(request, callOptions: getCallOptions());
//        return try await result.response.valid;
//    }
//}
//
//class ProviderService : ServiceBase {
//    var providerClient: Trinsic_Services_ProviderClient;
//    init(serviceAddress: String = "http://localhost:5000") async throws {
//        let url = try ServiceBase.createAndVerifyUrl(serviceAddress: serviceAddress)
//
//        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1);
//        let channel = ClientConnection.insecure(group: group).connect(host: url.host!, port: url.port!);
//        providerClient = Trinsic_Services_ProviderClient(channel: channel);
//    }
//
//    func inviteParticipant(request: Trinsic_Services_InviteRequest) async throws -> Trinsic_Services_InviteResponse {
//        // TODO - One of contact method.
//        let result = try providerClient.invite(request, callOptions: self.getCallOptions());
//        return try await result.response;
//    }
//
//    func invitationStatus(request: Trinsic_Services_InvitationStatusRequest) async throws -> Trinsic_Services_InvitationStatusResponse {
//        // TODO - One of contact method.
//        let result = try providerClient.invitationStatus(request, callOptions: self.getCallOptions());
//        return try await result.response;
//    }
//}
