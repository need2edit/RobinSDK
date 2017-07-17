import Foundation

public struct Organization: Serializable, Named, ChangeTrackingRecord, SlugRepresentable, AvatarRepresentable {

    public struct Identifier: RawRepresentable, Hashable, Equatable, Codable {
        public var hashValue: Int {
            return rawValue.hashValue
        }
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
    }

    public let id: Identifier
    public let is_organization: Bool
    public let name: String
    public let slug: String
    public let avatar: String
    
    public let created_at: Date
    public let updated_at: Date
}

extension Organization.Identifier {
    static public func == (lhs: Organization.Identifier, rhs: Organization.Identifier) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Organization {
    static public func ==(lhs: Organization, rhs: Organization) -> Bool {
        return lhs.id == rhs.id
    }
}
