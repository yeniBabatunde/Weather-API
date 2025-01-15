//
//  CustomFont.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

enum CustomFont: String {
    case poppinsRegular = "Poppins-Regular"
    case poppinsBold = "Poppins-Bold"
    case poppinsMedium = "Poppins-Medium"
    case poppinsExtraBold = "Poppins-ExtraBold"
    case poppinsSemiBold = "Poppins-SemiBold"
    
    func font(size: CGFloat, weight: Font.Weight? = nil) -> Font {
           let fontWeight: Font.Weight
           
           switch weight {
           case .some(.heavy):
               fontWeight = .heavy
           case .some(.bold):
               fontWeight = .bold
           case .some(.semibold):
               fontWeight = .semibold
           case .some(.medium):
               fontWeight = .medium
           case .some(.light):
               fontWeight = .light
           default:
               fontWeight = .regular
           }
           
           return Font.custom(self.rawValue, size: size).weight(fontWeight)
       }
}

