//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation

import XCTest
@testable import Trinsic

final class AccountTests: XCTestCase {
    func testAccountService() throws {
        var service = Services.Account()
            .with(endpoint: "staging-internal.trinsic.cloud")
            .build()
        
        let profile = try service.signIn()
        
        XCTAssertNotNil(profile)
        XCTAssertFalse(profile.protection.enabled)
        
        service = Services.Account()
            .with(endpoint: "staging-internal.trinsic.cloud")
            .with(profile: profile)
            .build()
        
        let info = try service.info()
        
        XCTAssertNotNil(info)
        XCTAssertNotNil(info.details)
    }
}
