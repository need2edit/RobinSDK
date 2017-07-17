import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case patch = "PATCH"
    case delete = "DELETE"
    case post = "POST"
}

public protocol RouteType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

public class RobinSDK {
    
    public let token: String
    
    public init(_ token: String) {
        self.token = token
    }
    
    public static let baseURL = URL(string: "https://api.robinpowered.com/v1.0")!
    
    public enum Route: RouteType {
        
        case auth
        
        case showOrganizations
        case showOrganization(id: Int)
        case showOrganizationLocations(id: Int)
        case showOrganizationUsers(id: Int)
        case showOrganizationUser(id: Int, userId: Int)
        case showOrganizationAmenities(id: Int)
        
        case showMe
        case showMePresence
        case showMeEvents
        
        case showLocation(id: Int)
        case showLocationSpaces(id: Int)
        case showLocationPresence(id: Int)
        
        case showSpace(id: Int)
        case showSpaceEvents(id: Int)
        case showSpaceAmenities(id: Int)
        case showSpacePresence(id: Int)
        case showSpaceDevices(id: Int)
        case showSpaceState(id: Int)
        
        case showEvent(id: Int)
        case showEventConfirmation(id: Int)
        
        public var path: String {
            switch self {
            case .auth:
                return "/auth"
            case .showOrganizations:
                return "/organizations"
            case .showOrganization(let id):
                return "/organizations/\(id)"
            case .showOrganizationLocations(let id):
                return "/organizations/\(id)/locations"
            case .showOrganizationUsers(let id):
                return "/organizations/\(id)/users"
            case .showOrganizationUser(let id, let user_id):
                return "/organizations/\(id)/users/\(user_id)"
            case .showOrganizationAmenities(let id):
                return "/organizations/\(id)/amenities"
            case .showMe:
                return "/me"
            case .showMePresence:
                return "/me/presence"
            case .showMeEvents:
                return "/me/events"
            case .showLocation(let id):
                return "/locations/\(id)"
            case .showLocationSpaces(let id):
                return "/locations/\(id)/spaces"
            case .showLocationPresence(let id):
                return "/locations/\(id)/presence"
            case .showSpace(let id):
                return "/spaces/\(id)"
            case .showSpaceEvents(let id):
                return "/spaces/\(id)/events"
            case .showSpaceAmenities(let id):
                return "/spaces/\(id)/amenities"
            case .showSpacePresence(let id):
                return "/spaces/\(id)/presence"
            case .showSpaceDevices(let id):
                return "/spaces/\(id)/devices"
            case .showSpaceState(let id):
                return "/spaces/\(id)/state"
            case .showEvent(let id):
                return "/events/\(id)"
            case .showEventConfirmation(let id):
                return "/events/\(id)/confirmation"
            }
        }

        public var baseURL: URL {
            return RobinSDK.baseURL
        }

        public var method: HTTPMethod {
            return .get
        }
    }
}

