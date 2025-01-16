//
//  Constants.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import Foundation

enum Constants {
    enum ApiHelper {
        static let imageUrlBase =
        "https:"
        static let baseURL = "https://api.weatherapi.com/"
        static let authorizationKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    }
    
    enum Strings {
        static let searchFieldPlaceholder = "Search Location"
        static let noData = "Please search for another city"
        static let searchForCity = "Please Search For A City"
        static let noCitySelected = "No City Selected"
        static let cityNotFound = "City not found"
        static let anIssueOccuredTitleDescription = "An issue occurred while fetching weather data.\nPlease try again later."
        static let loadingData = "Loading..."
        static let defaultText = "Default Country Name"
        static let errorTitle = "An Error Occurred"
        static let ok = "OK"
    }
    
    enum UserDefaultsKeys {
        static let lastWeatherData = "lastWeatherData"
        static let lastCity = "lastCity"
    }
    
    enum Alert {
        static let errorTitle = "Error"
    }
}
