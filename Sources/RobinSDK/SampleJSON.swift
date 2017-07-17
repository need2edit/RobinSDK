import Foundation

public struct SampleJSON {
    
    public static let token = """
        {
        "id":123,
        "token":"abc123",
        "name":"Authenticated User",
        "type":"account",
        "ip":"127.0.0.1",
        "agent":"",
        "scopes":[
        "basic_read",
        "basic_write"
        ],
        "expire_at":"2014-04-25T19:50:36+0000",
        "created_at":"2014-04-25T17:50:36+0000"
        }
    """
    
    public static let device = """
                                {
                                    "id": 1,
                                    "account_id": 3,
                                    "device_manifest_id": 13,
                                    "name": "PIR sensor",
                                    "last_reported_at": "2014-05-24T21:00:35+0000",
                                    "created_at": "2014-05-19T21:00:35+0000",
                                    "updated_at": "2014-05-19T21:00:35+0000"
                                }
                                """
    
    public static let presence = """
                                {
                                  "location_id": 1,
                                  "space_id": 1,
                                  "user_id": 4,
                                  "device_id": 2,
                                  "last_seen_at": "2014-05-22T14:49:48+0000",
                                  "arrived_at": "2014-05-22T14:49:48+0000",
                                  "expired_at": "2014-05-22T14:50:18+0000",
                                  "session_ttl": 30,
                                  "session_active": true,
                                  "device": \(SampleJSON.device),
                                  "user": {
                                    "id": 1,
                                    "name": "Brian",
                                    "slug": "brian",
                                    "avatar": "",
                                    "created_at": "2014-05-05T16:06:58+0000",
                                    "updated_at": "2014-05-05T16:06:58+0000",
                                    "primary_email": {
                                      "email": "brian@robinpowered.com",
                                      "is_verified": false
                                    }
                                  }
                                }
                                """
    public static let space = """
                                {
                                "id": 78,
                                "location_id": 5,
                                "name": "Conference Room",
                                "description": "Front meeting space for up to 14 people.",
                                "image": "https://static.robinpowered.com/apps-api/space-images/014d9bbab4f9efe3102db1e05c8898a4.jpg",
                                "discovery_radius": 3.5,
                                "capacity": 10,
                                "type": "conference",
                                "last_presence_at": "2014-10-16T13:33:21+0000",
                                "is_disabled": false,
                                "is_dibsed": false,
                                "is_accessible": true,
                                "updated_at": "2014-08-22T14:37:02+0000",
                                "created_at": "2014-08-21T14:50:12+0000"
                                }
                                """
    public static let user = """
                            {
                              "id": 1,
                              "name": "Brian",
                              "slug": "brian",
                              "avatar": "",
                              "created_at": "2014-05-05T16:06:58+0000",
                              "updated_at": "2014-05-05T16:06:58+0000",
                              "primary_email": {
                                "email": "brian@robinpowered.com",
                                "is_verified": false
                              }
                            }
                            """
}
