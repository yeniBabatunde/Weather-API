//
//  WeatherView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
                .padding()
            
            switch viewModel.viewState {
            case .empty:
                EmptyStateView()
            case .loading:
                ProgressView(Constants.Strings.loadingData)
            case .searchResults(let weatherItems):
                SearchResultsListView(weatherItems: weatherItems) { weather in
                    viewModel.selectLocation(weather)
                }
            case .loaded(let weatherData):
                WeatherMoodView(weatherData: weatherData)
            }
            Spacer()
        }
    }
}

#Preview {
    WeatherView(viewModel: WeatherViewModel())
}

/*
 
 */
