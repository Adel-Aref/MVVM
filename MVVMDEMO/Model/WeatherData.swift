//
//  WeatherData.swift
//  MVVMDEMO
//
//  Created by Adel on 2/6/19.
//  Copyright © 2019 Adel. All rights reserved.
//

import Foundation
import Mapper

struct WeatherData: Mappable {
    
    let lat: Double
    let long: Double
    let windSpeed: Double
    let fahrenheit: Double
    let hourlyDataPoints: [WeatherDataPoint]
   
    init(map: Mapper) throws {
        lat = try map.from("latitude")
        long = try map.from("longitude")
        
        windSpeed = try map.from("currently.windSpeed")
        fahrenheit = try map.from("currently.temperature")
        
        hourlyDataPoints = try map.from("hourly.data")
    }
    
}
//


struct WeatherDataPoint: Mappable {
    
    let time: Int
    let windSpeed: Double
    let fahrenheit: Double
    
    init(map: Mapper) throws {
        time = try map.from("time")
        windSpeed = try map.from("windSpeed")
        fahrenheit = try map.from("temperature")
    }
    
}
//
fileprivate struct RawServerResponse: Decodable {
    struct User: Decodable {
        var user_name: String
        var real_info: UserRealInfo
    }
    
    struct UserRealInfo: Decodable {
        var full_name: String
    }
    
    struct Review: Decodable {
        var count: Int
    }
    
    var id: Int
    var user: User
    var reviews_count: [Review]
}

struct ServerResponse: Decodable {
    var id: String
    var username: String
    var fullName: String
    var reviewCount: Int
    
    init(from decoder: Decoder) throws {
        let rawResponse = try RawServerResponse(from: decoder)
        
        // Now you can pick items that are important to your data model,
        // conveniently decoded into a Swift structure
        id = String(rawResponse.id)
        username = rawResponse.user.user_name
        fullName = rawResponse.user.real_info.full_name
        reviewCount = rawResponse.reviews_count.first!.count
    }
}
//\

class Info: Codable {
    var Info: [InfoJSON]
    enum CodingKeys: String, CodingKey {
        case Info = "info"
    }
}
class InfoJSON: Codable {
    var email: [Email]
    var gender: String
    var name :Name
    enum CodingKeys: String, CodingKey {
        case email,gender,name
    }
}
class Name: Codable {
    var first: String
    var last: String
}
//
class Email: Codable{
    var email_String :String
    var email_type :String
    
    enum CodingKeys: String, CodingKey{
        case email_String = "emailString"
        case email_type = "emailType"
    }
}
