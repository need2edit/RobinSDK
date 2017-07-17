import Foundation


/// A collection of spaces. Most commonly a building or floor.
///
/// Physically speaking, a location is typically an office or a building and can be associated to a specific physical address.
///
/// - warning: Locations should exist on a map. Locations that do not adhere to this constraint by containing spaces that belong to different (or non-existent) geographical locations may be subject to removal.
public struct Location: Serializable, ImageRepresentable {

    public struct Identifier: RawRepresentable, Hashable, Equatable, Codable {
        public var hashValue: Int {
            return rawValue.hashValue
        }
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
    }

    /// The ID of the location
    public let id: Identifier
    
    /// The ID of the organization
    public let account_id: String
    
    /// The ID of the campus. This may be null if the location doesn't belong to a campus.
    public let campus_id: Int?
    
    /// The name of the location
    public let name: String
    
    /// The description of the location
    public let description: String
    
    /// The street address of the location
    public let address: String
    
    /// A URL of containing a photo of or image representing the location
    public let image: URL
    
    /// A latitude coordinate resolved from the address field
    public let latitude: Float
    
    /// A longitude coordinate resolved from the address field
    public let longitude: Float
    
    public let updated_at: Date
    public let created_at: Date
}

extension Location.Identifier {
    static public func ==(lhs: Location.Identifier, rhs: Location.Identifier) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Location {
    static public func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}
