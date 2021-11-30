//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation

import XCTest
@testable import Services

final class AccountTests: XCTestCase {
    func testSignIn() throws {
        let service = Service.Account()
            .with(endpoint: "staging-internal.trinsic.cloud")
            .build()
        
        let profile = try service.signIn()
        
        XCTAssertNotNil(profile)
        XCTAssertFalse(profile.protection.enabled)
    }
}
