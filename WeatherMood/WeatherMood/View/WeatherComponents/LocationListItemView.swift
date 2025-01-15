//
//  LocationListItemView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct LocationListItemView: View {
    let weatherData: WeatherData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Mumbai")
                    .font(CustomFont.poppinsBold.font(size: 20, weight: .semibold))
                    .foregroundColor(._2C2C2C)
                
                Text("20°")
                    .font(CustomFont.poppinsMedium.font(size: 60, weight: .medium))
                    .foregroundColor(._2C2C2C)
            }
            
            Spacer()
            
            Image("moody")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 83, height: 67)
        }
        .padding()
        .background(Color(hex: "F2F2F2"))
        .cornerRadius(16)
    }
}

#Preview {
    LocationListItemView(weatherData: WeatherData())
}
