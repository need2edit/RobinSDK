import Foundation

/// A meeting or reservation, booked in a space.
///
/// Events are often synchronized from an external calendar service, such as Google Calendar or Office 365.
/// Events may also be created by booking a Space through Robin.
public struct Event: Serializable {

    public struct Identifier: RawRepresentable, Hashable, Equatable, Codable {
        public var hashValue: Int {
            return rawValue.hashValue
        }
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
    }

    /// The ID of the event.
    public let id: Identifier
    
    /// The title of the event.
    public let title: String
    
    /// The event description.
    public let description: String
    
    /// The start of the event.
    public let start: String
    
    /// The end of the event.
    public let end: String
    
    /// The ID of the user that is the organizer of the event. This value may be null if the organizer is not a Robin User.
    public let organizer_id: Int
    
    /// The email address of the event organizer.
    public let organizer_email: String
    
    /// The ID of the user that is the originally created the event. This value may be null if the creator is not a Robin User.
    public let creator_id: Int
    
    /// The email address of the event creator.
    public let creator_email: String
    
    /// The ID of the Space that the event is booked in.
    public let space_id: Int
    
    /// An array of people invited to the event.
    public let invitees: [User]
    
    /// The external ID of the event if it exists on an external calendar service.
    public let remote_event_id: String
    
    /// If the event exists on an external calendar service, this will be an enum that identifies the service. (eg. "google")
    public let remote_type: String
    
    
    /// Captures the origin of the Robin event creation.
    ///
    /// - synced: Synced implies the event originated on a remote service.
    /// - manual: A manual event is an explicit through Robin.
    /// - automatic: An automatic event was created by Robin due to presence.
    public enum CreationType: String, Codable {
        case synced
        case manual
        case automatic
    }
    
    /// Either "synced", "manual", or "automatic". Synced implies the event originated on a remote service. A manual event is an explicit through Robin. An automatic event was created by Robin due to presence.
    public let creation_type: CreationType
    
    /// Flags an event as an "all day" event.
    public let is_all_day: Bool
    
    public enum Visibility: String, Codable {
        case `default`
        case `public`
        case `private`
        case personal
        case confidential
    }
    
    /// The visibility type for the event. May be default, public, private, personal or confidential.
    public let visibility: Visibility
    
    /// Event unique identifier as defined in RFC5545. It is used to uniquely identify events across calendaring systems.
    /// Note that the UID and the id are not identical. One difference in their semantics is that in recurring events, all occurrences of one event have different ids while they all share the same UIDs.
    public let uid: String
    
    /// List of RRULE, EXRULE, RDATE and EXDATE lines for a recurring event, as specified in RFC5545.
    public let recurrence: [String]
    
    /// The ID of the series that the event is a part of, if the event is a recurring instance.
    public let series_id: String
    
    /// The iCal recurrence ID of the event, if it is part of a series.
    public let recurrence_id: String
    
}

extension Event.Identifier {
    static public func ==(lhs: Event.Identifier, rhs: Event.Identifier) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Event {
    static public func ==(lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
}
