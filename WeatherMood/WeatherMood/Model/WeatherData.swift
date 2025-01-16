//
//  WeatherData.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation


struct WeatherData: Codable {
    let location: Location?
    var current: Current?

    enum CodingKeys: String, CodingKey {
        case location
        case current
    }
}

struct Location: Codable {
    let country: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case country
        case name
    }
}

struct Current: Codable {
    let tempC: Double?
    var condition: Condition?
    let humidity: Int?
    let uv: Double?
    let feelslikeC: Double?

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case humidity
        case uv
        case feelslikeC = "feelslike_c"
    }
}

struct Condition: Codable {
    let text: String?
    let icon: String?
    var imageData: Data?
    
    var imageIconURL: String? {
         "\(Constants.ApiHelper.imageUrlBase)\(icon ?? "")"
     }
}
