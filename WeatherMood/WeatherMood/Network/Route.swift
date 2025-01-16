//
//  Route.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

enum Route {
    case weatherFeel
    
    var description: String {
        switch self {
        case .weatherFeel:
            return "v1/current.json"
        }
    }
}
