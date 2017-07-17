import Foundation

public struct Busy: Serializable {
    public let from: Date
    public let to: Date
    public let events: [Event]
}

public struct FreeBusy: Serializable {
    let has_presence: Bool
    let space: Space
    let user: User
    let busy: [Busy]
}
