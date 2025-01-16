//
//  Color+Extension.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6: 
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
 
    static var _2C2C2C: Color {
        return Color(hex: "#2C2C2C")
    }
    static var _C4C4C4: Color {
        return Color(hex: "#C4C4C4")
    }
    static var _9A9A9A: Color {
        return Color(hex: "#9A9A9A")
    }
    static var _F2F2F2: Color {
        return Color(hex: "#F2F2F2")
    }
}
