//
//  WeatherMoodView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct WeatherMoodView: View {
    let weatherData: WeatherData
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                Image("moody")
                    .resizable()
                    .frame(width: 123, height: 113)
                
                HStack {
                    Text("Hyderabad")
                        .font(CustomFont.poppinsSemiBold.font(size: 30, weight: .semibold))
                    Image(systemName: "location.fill")
                        .foregroundColor(._2C2C2C)
                }
                
                Text("31°")
                    .font(CustomFont.poppinsMedium.font(size: 70, weight: .medium))
            }
            .frame(maxWidth: .infinity)
            .background(Color.clear)
            
            //MARK: Weather Metrics Container
            VStack(spacing: 12) {
                HStack(spacing: 20) {
                    MetricItemView(
                        title: "Humidity",
                        value: "20%",
                        titleSize: 12
                    )
                    Spacer()
                    MetricItemView(
                        title: "UV",
                        value: String(4),
                        titleSize: 12
                    )
                    Spacer()
                    MetricItemView(
                        title: "Feels Like",
                        value: "38°",
                        titleSize: 8
                    )
                }
                
            }
            .frame(width: 274, height: 75, alignment: .center)
            .padding(.horizontal, 20)
            .background(Color(hex: "#F2F2F2"))
            .cornerRadius(16)
            .offset(x: 0, y: 0)
        }
        .padding()
    }
}

#Preview {
    WeatherMoodView(weatherData: WeatherData())
}
