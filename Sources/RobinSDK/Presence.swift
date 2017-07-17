import Foundation

/**
 
 A presence object may be associated with a user resource directly, or with a device. If presence is associated to a device, that typically indicates that a person is sensed but cannot be identified. This is common when detecting presence using devices such as IR sensors.
 
 Upon creation, the arrived_at attribute is initialized to the current time and the expired_at value is set to the TTL (time to live) added to the current time.
 
 Each time presence is posted for a user or device that already has an active presence session (a session in the same space that hasn't expired) than the active session will be lengthened by the provided TTL. Otherwise a new presence session is created.
 
 - note: *Keep your presence TTL short.* The maximum allowed TTL is 20 minutes, however for the best results we recommend using a value less than 5 minutes. In the future we may reduce the maximum allowed TTL.
 
 */
public struct Presence: Serializable {
    
    /// The ID of the location where the presence was detected.
    public let location_id: Location.Identifier
    
    /// The ID of the space where the presence was detected or null if the presence exists at the location (not space) level.
    public let space_id: Int
    
    /// The ID of the user, or null if the presence is associated only to a device.
    public let user_id: Int
    
    /// The ID of the device, or null if the presence is associated only to a user.
    public let device_id: Device.Identifier
    
    /// The date and time when the presence was last seen, represented as an ISO-8601 date.
    public let last_seen_at: Date
    
    /// The date and time when the presence was first detected, represented as an ISO-8601 date.
    public let arrived_at: Date
    
    /// The date and time when the presence will expire, represented as an ISO-8601 date. (This should always be equal to the TTL added to the last_seen_at attribute)
    public let expired_at: Date
    
    /// Indicates whether the session is currently active.
    public let session_active: Bool
    
    /// The user resource, if the presence is associated to a user.
    public let user: User
    
    /// The Device resource, if the presence is associated to a device.
    public let device: Device
}
