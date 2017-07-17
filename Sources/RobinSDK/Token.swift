//
//  Token.swift
//  RobinSDK
//
//  Created by Jake Young on 6/30/17.
//

import Foundation

public struct AuthToken: Serializable, RemoteIdentifiable, Named {
    public var id: Int
    public var token: String
    public var name: String
    public var type: String
    public var ip: String
    public var agent: String
    public var scopes: [String]
    public var expire_at: Date
    public var created_at: Date
}

extension AuthToken {
    static public func ==(lhs: AuthToken, rhs: AuthToken) -> Bool {
        return lhs.id == rhs.id && lhs.token == rhs.token
    }
}
