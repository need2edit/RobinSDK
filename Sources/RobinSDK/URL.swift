//
//  Response.swift
//  RobinSDKTests
//
//  Created by Jake Young on 6/30/17.
//

import Foundation

extension URL {
    public init(route: RobinSDK.Route) {
        self = route.baseURL.appendingPathComponent(route.path)
    }
}
