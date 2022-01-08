//
//  File.swift
//
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import XCTest
@testable import Trinsic

final class TemplateTests: XCTestCase {
    
    let testEndpoint = "staging-internal.trinsic.cloud"
    var profile: AccountProfile?
    
    override func setUpWithError() throws {
        self.profile = try Services.Account()
            .with(endpoint: testEndpoint)
            .build()
            .signIn()
    }
    
    func testTemplatesDemo() throws {
        
        let service = Services.Template()
            .with(endpoint: testEndpoint)
            .with(profile: self.profile!)
            .build()
        
        var createRequest = Services_Verifiablecredentials_Templates_V1_CreateCredentialTemplateRequest()
        createRequest.name = "Test Swift Template Credential"
        createRequest.fields["firstName"] = Services_Verifiablecredentials_Templates_V1_TemplateField()
        
        let createResponse = try service.create(request: createRequest)
        
        XCTAssertNotNil(createResponse)
        XCTAssertNotEqual(createResponse.data.id, "")

        var getRequest = Services_Verifiablecredentials_Templates_V1_GetCredentialTemplateRequest()
        getRequest.id = createResponse.data.id
        
        let response = try service.get(request: getRequest)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response.template, createResponse.data)
    }
}
