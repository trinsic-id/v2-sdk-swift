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
    
    let testEndpoint = "staging-internal.trinsic.cloud"
    var profile: AccountProfile?
    
    override func setUpWithError() throws {
        self.profile = try Services.Account()
            .with(endpoint: testEndpoint)
            .build()
            .signIn()
    }
    
    func testAddFramework() throws {
        
        let service = Services.TrustRegistry()
            .with(endpoint: testEndpoint)
            .with(profile: self.profile!)
            .build()
        
        var request = Services_Trustregistry_V1_AddFrameworkRequest()
        request.governanceFramework.governanceFrameworkUri = "https://test#\(UUID().uuidString)"
        request.governanceFramework.description_p = "test egf"
        
        let response = try service.addFramework(request: request)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response.status, .success)
    }
    
    func testRegisterIssuer() throws {
        
        let service = Services.TrustRegistry()
            .with(endpoint: testEndpoint)
            .with(profile: self.profile!)
            .build()
        
        var request = Services_Trustregistry_V1_RegisterIssuerRequest()
        request.governanceFrameworkUri = "https://test"
        request.didUri = "did:example:isser"
        request.credentialTypeUri = "https://credential"
        
        let response = try service.registerIssuer(request: request)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response.status, .success)
    }
}
