//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import XCTest
@testable import Trinsic

final class TrustRegistryTests: XCTestCase {
    
    let testEndpoint = "dev-internal.trinsic.cloud"
    var service: TrustRegistryService?
    
    override func setUpWithError() throws {
        var options = Sdk_Options_V1_ServiceOptions()
        options.serverEndpoint = testEndpoint
        let accountService = AccountService(options: options)
        
        options.authToken = try accountService.signIn(request: Services_Account_V1_SignInRequest())
        self.service = TrustRegistryService(options: options)
    }
    
    func testAddFramework() throws {
        var request = Services_Trustregistry_V1_AddFrameworkRequest()
        request.governanceFramework.governanceFrameworkUri = "https://test#\(UUID().uuidString)"
        request.governanceFramework.description_p = "test egf"
        request.governanceFramework.name = "Example Framework: #\(UUID().uuidString)"
        
        let response = try service!.addFramework(request: request)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response.status, .success)
    }
    
    func testRegisterIssuer() throws {
        var request = Services_Trustregistry_V1_RegisterIssuerRequest()
        request.governanceFrameworkUri = "https://test"
        request.didUri = "did:example:isser"
        request.credentialTypeUri = "https://credential"
        
        let response = try service!.registerIssuer(request: request)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response.status, .success)
    }
}
