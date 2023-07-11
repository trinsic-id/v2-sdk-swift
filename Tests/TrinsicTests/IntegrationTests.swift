//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
@testable import Trinsic
import XCTest

final class CredentialTests: XCTestCase {
    let testEndpoint = "dev-internal.trinsic.cloud"

    func testDemo() throws {
        var options = Sdk_Options_V1_ServiceOptions()
        options.serverEndpoint = testEndpoint

        let trinsicService = TrinsicService(options: options)

        // Create a wallet in the default ecosystem
        var createWalletRequest = Services_Universalwallet_V1_CreateWalletRequest()
        createWalletRequest.ecosystemID = "default"
        let createWalletResponse = try trinsicService.wallet().createWallet(request: createWalletRequest)

        trinsicService.options.authToken = createWalletResponse.authToken

        // Create new template
        var createTemplateRequest = Services_Verifiablecredentials_Templates_V1_CreateCredentialTemplateRequest()
        createTemplateRequest.name = "test-\(UUID().uuidString)"

        var field = Services_Verifiablecredentials_Templates_V1_TemplateField()
        field.type = Services_Verifiablecredentials_Templates_V1_FieldType.string
        field.title = "Full Name"
        field.description_p = "The full name of the entity"
        createTemplateRequest.fields["name"] = field

        var createTemplateResponse = try trinsicService.template().create(request: createTemplateRequest)

        XCTAssertNotNil(createTemplateResponse)
        XCTAssertNotEqual("", createTemplateResponse.data.id)

        // Issue credential
        var issueRequest = Services_Verifiablecredentials_V1_IssueFromTemplateRequest()
        issueRequest.templateID = createTemplateResponse.data.schemaUri // can also use "id"
        issueRequest.valuesJson = "{\"name\":\"Jane Doe\"}"

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        issueRequest.expirationDate = formatter.string(from: Date().addingTimeInterval(TimeInterval().advanced(by: 2 * 24 * 60 * 60)))

        var issueResponse = try trinsicService.credential().issueFromTemplate(request: issueRequest)

        XCTAssertNotNil(issueResponse)

        // Create proof
        var proofRequest = Services_Verifiablecredentials_V1_CreateProofRequest()
        proofRequest.documentJson = issueResponse.documentJson

        let proofResponse = try trinsicService.credential().createProof(request: proofRequest)

        XCTAssertNotNil(proofResponse)

        // Verify proof
        var verifyRequest = Services_Verifiablecredentials_V1_VerifyProofRequest()
        verifyRequest.proofDocumentJson = proofResponse.proofDocumentJson

        let verifyResponse = try trinsicService.credential().verifyProof(request: verifyRequest)

        XCTAssertNotNil(verifyResponse)
        for validationPolicy in verifyResponse.validationResults {
            XCTAssertTrue(validationPolicy.value.isValid, "Validation [\(validationPolicy.key)] is not valid")
        }
    }
}
