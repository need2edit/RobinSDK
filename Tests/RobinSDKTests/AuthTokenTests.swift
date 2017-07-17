//
//  AuthTokenTests.swift
//  RobinSDK
//
//  Created by Jake Young on 6/30/17.
//

import XCTest
@testable import RobinSDK

class AuthTokenTests: XCTestCase {
    
    func testJSON_Decode() {
        let decoder = JSONDecoder()
        
        if #available(OSX 10.12, *) {
            decoder.dateDecodingStrategy = .iso8601
        } else {
            // Fallback on earlier versions
        }
        let data = SampleJSON.token.data(using: .utf8)
        XCTAssertNotNil(data, "sample json for token not valid")
        
        let user = try? decoder.decode(AuthToken.self, from: data!)
        XCTAssertNotNil(user, "token could not be created from JSON")
        
        XCTAssertEqual(user!.id, 123)
        
        XCTAssertEqual(user!.name, "Authenticated User")
        XCTAssertEqual(user!.type, "account")
        XCTAssertEqual(user!.agent, "")
        XCTAssertEqual(user!.scopes, ["basic_read", "basic_write"])
    }
    
    static var allTests = [
        ("testJSON_Decode", testJSON_Decode),
        ]
    
}

