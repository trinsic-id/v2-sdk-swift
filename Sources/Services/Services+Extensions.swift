//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import GRPC
import SwiftProtobuf
import BLAKE3
import Proto
import Okapi

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}

extension Data {
    func toBase64URL() -> String {
        self.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}

extension ServiceProfile {
    func getMetadata(_ request: Message) throws -> CallOptions {
        
        guard let profile = self.profile else {
            throw SdkError.profileNotSet
        }
        
        let requestBytes = try request.serializedData()
        var requestHash = Data()
        
        if (requestBytes.count > 0)
        {
            requestHash = Data(BLAKE3.hash(requestBytes))
        }
        
        var nonce = Services_Common_V1_Nonce()
        nonce.requestHash = requestHash
        nonce.timestamp = Date().millisecondsSince1970
        
        var proofRequest = Okapi_Security_V1_CreateOberonProofRequest()
        proofRequest.nonce = try nonce.serializedData()
        proofRequest.data = profile.authData
        proofRequest.token = profile.authToken
        
        let proof = try Oberon.createProof(request: proofRequest)
        
        var options = CallOptions()
        options.customMetadata.add(
            name: "Authorization",
            value: String(format: "Oberon ver=1,proof=%@,data=%@,nonce=%@",
                          proof.proof.toBase64URL(),
                          profile.authData.toBase64URL(),
                          try nonce.serializedData().toBase64URL()))
        
        return options
    }
}
