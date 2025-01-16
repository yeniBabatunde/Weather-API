//
//  WeatherViewState.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import Foundation

enum WeatherViewState {
    case empty
    case searchDataEmpty
    case loading
    case searchResults([WeatherData])
    case loaded(WeatherData)
    case error
}
