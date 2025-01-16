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
                WeatherIconView(
                    iconURL: weatherData.current?.condition?.imageIconURL ?? "",
                    width: 123,
                    height: 113, imageData: weatherData.current?.condition?.imageData ?? Data()
                )
                
                HStack {
                    Text(weatherData.location?.name ?? "")
                        .font(CustomFont.poppinsSemiBold.font(size: 30, weight: .semibold))
                    Image(systemName: "location.fill")
                        .foregroundColor(._2C2C2C)
                }
                ZStack(alignment: .topTrailing) {
                    Text("\(weatherData.current?.tempC?.clean ?? "0")")
                        .font(CustomFont.poppinsMedium.font(size: 70, weight: .medium))
                    
                    Text("°")
                        .font(CustomFont.poppinsRegular.font(size: 30))
                        .foregroundColor(._2C2C2C)
                        .offset(x: 13, y: -10)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.clear)
            
            VStack(spacing: 12) {
                HStack(spacing: 20) {
                    MetricItemView(
                        title: "Humidity",
                        value: "\(weatherData.current?.humidity ?? 0)%",
                        titleSize: 12
                    )
                    Spacer()
                    MetricItemView(
                        title: "UV",
                        value: String(weatherData.current?.uv?.clean ?? "0"),
                        titleSize: 12
                    )
                    Spacer()
                    MetricItemView(
                        title: "Feels Like",
                        value: "\(weatherData.current?.feelslikeC?.clean ?? "0")°",
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
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    WeatherMoodView(weatherData: JustSampleData.sampleWeatherData())
}
