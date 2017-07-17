//
//  PresenceTests.swift
//  RobinSDKTests
//
//  Created by Jake Young on 6/30/17.
//

import XCTest
@testable import RobinSDK

class PresenceTests: XCTestCase {
    
    func testJSON_Decode() {
        let decoder = JSONDecoder()
        
        if #available(OSX 10.12, *) {
            decoder.dateDecodingStrategy = .iso8601
        } else {
            // Fallback on earlier versions
        }
        let data = SampleJSON.presence.data(using: .utf8)
        XCTAssertNotNil(data, "presence json for user not valid")
        
        let item = try! decoder.decode(Presence.self, from: data!)
        XCTAssertNotNil(item, "presence could not be created from JSON")
        
        let email = Email(email: "brian@robinpowered.com", is_verified: false)
        
        XCTAssertEqual(item.location_id, Location.Identifier(rawValue: 1))
        XCTAssertEqual(item.space_id, Space.Identifier(rawValue: 1))
        XCTAssertEqual(item.user_id, User.Identifier(rawValue: 4))
        XCTAssertEqual(item.device_id, Device.Identifier(rawValue: 2))

        XCTAssertNotNil(item.user)
        XCTAssertEqual(item.user!.id, 1)
        XCTAssertEqual(item.user!.name, "Brian")
        XCTAssertEqual(item.user!.slug, "brian")
        
        XCTAssertEqual(item.user!.primary_email, email)
        
        XCTAssertEqual(item.session_active, true)
    }
    
    static var allTests = [
        ("testJSON_Decode", testJSON_Decode),
    ]
    
}

