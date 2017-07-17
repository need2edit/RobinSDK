import Foundation

public struct Email: Codable, Equatable {
    let email: String
    let is_verified: Bool
}

extension Email {
    static public func ==(lhs: Email, rhs: Email) -> Bool {
        return lhs.email == rhs.email
    }
}


/// An account that belongs to a physical person.
public struct User: Serializable, RemoteIdentifiable, Named, ChangeTrackingRecord, SlugRepresentable, AvatarRepresentable {

    public struct Identifier: RawRepresentable, Hashable, Equatable, Codable {
        public var hashValue: Int {
            return rawValue.hashValue
        }
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
    }

    /// The ID of the user.
    public var id: Int
    
    /// The user's full name.
    public let name: String
    
    /// The user's username.
    public let slug: String
    
    /// A url containing the user's avatar image.
    public let avatar: String
    
    /// The user's primary email, if available. Primary email is only exposed to accounts that have the proper permission.
    public let primary_email: Email?
    
    public let created_at: Date
    public let updated_at: Date
}

extension User.Identifier {
    static public func ==(lhs: User.Identifier, rhs: User.Identifier) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension User {
    static public func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
