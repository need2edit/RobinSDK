//
//  DeviceTests.swift
//  RobinSDKTests
//
//  Created by Jake Young on 6/30/17.
//

import XCTest
@testable import RobinSDK

class DeviceTests: XCTestCase {
    
    func testJSON_Decode() {
        let decoder = JSONDecoder()
        
        if #available(OSX 10.12, *) {
            decoder.dateDecodingStrategy = .iso8601
        } else {
            // Fallback on earlier versions
        }
        let data = SampleJSON.device.data(using: .utf8)
        XCTAssertNotNil(data, "sample json for device not valid")
        
        let device = try? decoder.decode(Device.self, from: data!)
        XCTAssertNotNil(device, "device could not be created from JSON")
        
        XCTAssertEqual(device!.id, Device.Identifier(rawValue: 1))
        XCTAssertEqual(device!.account_id, 3)
        XCTAssertEqual(device!.device_manifest_id, 13)
        XCTAssertEqual(device!.name, "PIR sensor")
        XCTAssertEqual(device!.id, Device.Identifier(rawValue: 1))
    }
    
    static var allTests = [
        ("testJSON_Decode", testJSON_Decode),
    ]

}
