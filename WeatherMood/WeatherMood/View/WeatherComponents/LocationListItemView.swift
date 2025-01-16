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
                Text(weatherData.location?.name ?? Constants.Strings.defaultText)
                    .font(CustomFont.poppinsBold.font(size: 20, weight: .semibold))
                    .foregroundColor(._2C2C2C)

                ZStack(alignment: .topTrailing) {
                    Text("\(weatherData.current?.tempC?.clean ?? "0")")
                        .font(CustomFont.poppinsMedium.font(size: 60, weight: .medium))
                        .foregroundColor(._2C2C2C)

                    Text("°")
                        .font(CustomFont.poppinsRegular.font(size: 40, weight: .thin))
                        .foregroundColor(._2C2C2C)
                        .offset(x: 15, y: -15)
                }
            }
            Spacer()
            WeatherIconView(
                iconURL: weatherData.current?.condition?.imageIconURL ?? "",
                           width: 83,
                height: 67, imageData: weatherData.current?.condition?.imageData ?? Data()
            )
        }
        .padding()
        .background(Color(hex: "F2F2F2"))
        .cornerRadius(16)
    }
}

#Preview {
    LocationListItemView(weatherData: JustSampleData.sampleWeatherData())
}
