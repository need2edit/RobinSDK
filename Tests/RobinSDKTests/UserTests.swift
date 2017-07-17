//
//  UserTests.swift
//  RobinSDKTests
//
//  Created by Jake Young on 6/30/17.
//

import XCTest
@testable import RobinSDK

class UserTests: XCTestCase {
    
    func testJSON_Decode() {
        let decoder = JSONDecoder()
        
        if #available(OSX 10.12, *) {
            decoder.dateDecodingStrategy = .iso8601
        } else {
            // Fallback on earlier versions
        }
        let data = SampleJSON.user.data(using: .utf8)
        XCTAssertNotNil(data, "sample json for user not valid")
        
        let user = try? decoder.decode(User.self, from: data!)
        XCTAssertNotNil(user, "user could not be created from JSON")
        
        let email = Email(email: "brian@robinpowered.com", is_verified: false)
        
        XCTAssertEqual(user!.id, 1)
        
        XCTAssertEqual(user!.name, "Brian")
        XCTAssertEqual(user!.slug, "brian")
        XCTAssertEqual(user!.avatar, "")
        XCTAssertEqual(user!.primary_email, email)
    }
    
    static var allTests = [
        ("testJSON_Decode", testJSON_Decode),
    ]
    
}
