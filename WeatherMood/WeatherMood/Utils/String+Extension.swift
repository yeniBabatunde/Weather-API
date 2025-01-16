//
//  String+Extension.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
