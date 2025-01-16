//
//  NetworkError.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case error(statusCode: Int, data: Data?)
    case invalidData
}

