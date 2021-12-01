//
//  File.swift
//  
//
//  Created by Tomislav Markovski on 11/30/21.
//

import Foundation
import Proto
import XCTest
@testable import Services

final class WalletTests: XCTestCase {
    
    let testEndpoint = "staging-internal.trinsic.cloud"
    var profile: AccountProfile?
    
    override func setUpWithError() throws {
        self.profile = try Services.Account()
            .with(endpoint: testEndpoint)
            .build()
            .signIn()
    }
    
    func testSearch() throws {
        
        let service = Services.Wallet()
            .with(endpoint: testEndpoint)
            .with(profile: self.profile!)
            .build()
        
        let response = try service.search()
        
        XCTAssertNotNil(response)
    }
    
    func testInsertItem() throws {
        
        let service = Services.Wallet()
            .with(endpoint: testEndpoint)
            .with(profile: self.profile!)
            .build()
        
        let response = try service.insertItem(item: ["test": "document"])
        
        XCTAssertNotNil(response)
    }
}
