import Foundation

// Use this to clean up some boiler plate code.
public protocol Serializable: Codable {
    func serialize() -> Data?
}

extension Serializable {
    public func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

public protocol Named {
    var name: String { get }
}

public protocol RemoteIdentifiable: Equatable {
    var id: Int { get }
}

public protocol SlugRepresentable {
    var slug: String { get }
}

public protocol AvatarRepresentable {
    var avatar: String { get }
}

extension AvatarRepresentable {
    var avatarURL: URL? {
        return URL(string: avatar)
    }
}

public protocol ImageRepresentable {
    var image: URL { get }
}

public protocol ChangeTrackingRecord: Comparable {
    var created_at: Date { get }
    var updated_at: Date { get }
}

extension ChangeTrackingRecord {
    static public func <(lhs: Self, rhs: Self) -> Bool {
        return lhs.created_at < rhs.created_at
    }
}

protocol LocationRepresentable {
    var latitude: Float { get }
    var longitude: Float { get }
}
