//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
@testable import Trinsic
import XCTest

final class TrustRegistryTests: XCTestCase {
    let testEndpoint = "dev-internal.trinsic.cloud"
    var service: TrinsicService?

    override func setUpWithError() throws {
        var options = Sdk_Options_V1_ServiceOptions()
        options.serverEndpoint = testEndpoint
        let trinsicService = TrinsicService(options: options)
        var createWalletRequest = Services_Universalwallet_V1_CreateWalletRequest()
        createWalletRequest.ecosystemID = "default"
        let createdWallet = try trinsicService.wallet().createWallet(request: createWalletRequest)
        let authToken = createdWallet.authToken
        options.authToken = authToken
        service = TrinsicService(options: options)
    }

    func testAddFramework() throws {
        var request = Services_Trustregistry_V1_AddFrameworkRequest()
        request.governanceFrameworkUri = "https://test#\(UUID().uuidString)"
        request.description_p = "test egf"
        request.name = "Example Framework: #\(UUID().uuidString)"

        let response = try service!.trustRegistry().addFramework(request: request)

        XCTAssertNotNil(response)

        var registerRequest = Services_Trustregistry_V1_RegisterMemberRequest()
        registerRequest.frameworkID = response.id
        registerRequest.didUri = "did:example:isser"
        registerRequest.schemaUri = "https://credential"

        let response2 = try service!.trustRegistry().registerMember(request: registerRequest)

        XCTAssertNotNil(response2)
    }
}
