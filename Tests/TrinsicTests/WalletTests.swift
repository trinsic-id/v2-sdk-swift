//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
@testable import Trinsic
import XCTest

final class WalletTests: XCTestCase {
    let testEndpoint = "dev-internal.trinsic.cloud"
    var service: TrinsicService?

    override func setUpWithError() throws {
        var options = Sdk_Options_V1_ServiceOptions()
        options.serverEndpoint = testEndpoint
        let trinsicService = TrinsicService(options: options)
        let createdWallet = try trinsicService.wallet().createWallet(request: Services_Universalwallet_V1_CreateWalletRequest(ecosystemId: "default"))
        let authToken = createdWallet.authToken
        options.authToken = authToken
        service = TrinsicService(options: options)
    }

    func testSearch() throws {
        let response = try service!.wallet().searchWallet()

        XCTAssertNotNil(response)
    }

    func testInsertItem() throws {
        var insertRequest = Services_Universalwallet_V1_InsertItemRequest()
        insertRequest.itemJson = "{\"test\": \"document\"}"

        let response = try service!.wallet().insertItem(request: insertRequest)

        XCTAssertNotNil(response)
    }
}
