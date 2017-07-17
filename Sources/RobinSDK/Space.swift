import Foundation


/// A room or area in a location.
///
/// Common examples include a "Conference Room" or "Lobby". Spaces are an important resource in that they are the parent model devices, presence and events. The space model contains references to the current and next events if they exist, as well as its parent location].
public struct Space: Serializable, ImageRepresentable {

    public struct Identifier: RawRepresentable, Hashable, Equatable, Codable {
        public var hashValue: Int {
            return rawValue.hashValue
        }
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
    }

    /// The ID of the space
    public var id: Identifier
    
    /// The ID of the location
    public let location_id: Int
    
    /// The ID of the level
    public let level_id: Int
    
    /// The name of the space
    public let name: String
    
    /// The description of the space
    public let description: String
    
    /// A URL of containing a photo of or image representing the space
    public let image: URL
    
    /// A decimal number that specifies the distance in meters from a beacon that a person should be standing within to be counted as present in the space
    public let discovery_radius: Float
    
    /// The people capacity of the space. The value returned will be null until this property is configured.
    public let capacity: Int
    
    public enum SpaceType: String, Codable {
        case breakout
        case call
        case conference
        case meeting
        case kitchen
        case work
        case office
        case lobby
        case lounge
        case utility
        case cafeteria
        case break_room
        case restroom
        case restroom_male
        case restroom_female
        case theater
        case fitness
        case study_room
        case cafe
        case lactation
        case parking
        case interview
        case studio
        case lab
        case classroom
        case listening
        case project
        case event
    }
    
    /// Categorical type of space
    public let type: SpaceType
    
    /// A date and time representing the last time presence was detected in the space
    public let last_presence_at: Date
    
    /// Indicates if the space is disabled or enabled. Disabled spaces cannot be used with most endpoints.
    public let is_disabled: Bool
    
    /// Indicates of the space is currently in a "dibsed" state.
    public let is_dibsed: Bool
    
    public let location: Location?
}

extension Space.Identifier {
    static public func ==(lhs: Space.Identifier, rhs: Space.Identifier) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Space {
    static public func ==(lhs: Space, rhs: Space) -> Bool {
        return lhs.id == rhs.id
    }
}
