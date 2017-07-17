//: Playground - noun: a place where people can play

import Foundation
import RobinSDK

// Setup our decoder
let decoder =  JSONDecoder()
let encoder = JSONEncoder()

// All of Robin's dates seem to follow iso8601 instead of seconds or miliseconds.
decoder.dateDecodingStrategy = .iso8601
encoder.dateEncodingStrategy = .iso8601

let data = SampleJSON.device.data(using: .utf8)!
let device = try! decoder.decode(Device.self, from: data)
