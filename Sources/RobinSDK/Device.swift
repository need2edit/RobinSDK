import Foundation

/// A piece of hardware that may exist in a space.
///
/// A device resource represents a piece of hardware that may exist in a space. Devices can report such as temperature or presence, but may also expose features that may be controlled, such as AV hardware or a thermostat. Common devices include beacons, phones, and motion sensors.
public struct Device: Serializable, Named, ChangeTrackingRecord, Comparable {

    public struct Identifier: RawRepresentable, Hashable, Equatable, Codable, Comparable {

        public var hashValue: Int {
            return rawValue.hashValue
        }
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
    }

    // The ID of the device.
    public let id: Identifier
    
    // The ID of the account that owns the device.
    public let account_id: Int
    
    // The ID of the associated device manifest. A device's capabilities are described by the manifest.
    public let device_manifest_id: Int
    
    // A name for the device, given by the owning account.
    public let name: String
    
    // The date that the device last communicated with Robin, represented as an ISO-8601 date.
    public let last_reported_at: Date
    
    // The date and time the resource was originally created, represented as an ISO-8601 date.
    public let created_at: Date
    
    // The date and time the resource was last modified, represented as an ISO-8601 date.
    public let updated_at: Date
}

extension Device.Identifier {

    static public func ==(lhs: Device.Identifier, rhs: Device.Identifier) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

    public static func <(lhs: Device.Identifier, rhs: Device.Identifier) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Device {
    static public func ==(lhs: Device, rhs: Device) -> Bool {
        return lhs.id == rhs.id
    }
    public static func <(lhs: Device, rhs: Device) -> Bool {
        return lhs.created_at < rhs.created_at
    }
}

extension Device: CustomStringConvertible {
    public var description: String {
        return self.name
    }
}
