//
//  JustSampleData.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

enum JustSampleData {
    
    static func sampleWeatherData() -> WeatherData {
        let location = Location(country: "Netherlands", name: "Amsterdam")
        let condition = Condition(text: "Mist", icon: "//cdn.weatherapi.com/weather/64x64/day/266.png")
        let current = Current(
            tempC: 32.3,
            condition: condition,
            humidity: 67,
            uv: 6.5,
            feelslikeC: 35.2
        )
        
        return WeatherData(location: location, current: current)
    }
}
