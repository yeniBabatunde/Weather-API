//
//  Double+Extension.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

extension Double {
    var clean: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
