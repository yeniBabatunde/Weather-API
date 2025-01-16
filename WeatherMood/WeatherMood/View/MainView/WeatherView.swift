//
//  WeatherView.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
            Spacer()
            
            switch viewModel.viewState {
            case .empty:
                EmptyStateView(titleText: Constants.Strings.noCitySelected, subtitleText: Constants.Strings.searchForCity)
            case .searchDataEmpty:
                EmptyStateView(titleText: Constants.Strings.cityNotFound, subtitleText: Constants.Strings.noData)
            case .loading:
                ProgressView(Constants.Strings.loadingData)
            case .searchResults(let weatherItems):
                SearchResultsListView(weatherItems: weatherItems) { weather in
                    viewModel.selectLocation(weather)
                }
            case .loaded(let weatherData):
                WeatherMoodView(weatherData: weatherData)
            case .error:
                EmptyStateView(titleText: "", subtitleText: Constants.Strings.anIssueOccuredTitleDescription)
            }
            Spacer()
        }
        .alert(Constants.Strings.errorTitle,
               isPresented: .init(
                get: { viewModel.errorMessage != nil },
                set: { if !$0 { viewModel.errorMessage = nil } }
               ),
               presenting: viewModel.errorMessage) { _ in
            Button(Constants.Strings.ok) {
                viewModel.errorMessage = nil
            }
        } message: { error in
            Text(error)
        }
    }
}


#Preview {
    WeatherView(viewModel:  WeatherRepoDIContainer.sharedInstance.makeWeatherMoodRepo())
}
