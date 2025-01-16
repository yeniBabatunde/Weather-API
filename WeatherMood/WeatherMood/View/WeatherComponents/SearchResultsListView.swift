//
//  SearchResultsListView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct SearchResultsListView: View {
    let weatherItems: [WeatherData]
    let onLocationSelected: (WeatherData) -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(weatherItems, id: \.location?.country) { weather in
                    LocationListItemView(weatherData: weather)
                        .onTapGesture {
                            onLocationSelected(weather)
                        }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    SearchResultsListView(weatherItems: [], onLocationSelected: {_ in 
      
    })
}
