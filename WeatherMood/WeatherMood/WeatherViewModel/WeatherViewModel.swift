//
//  WeatherViewModel.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var viewState: WeatherViewState = .empty
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSearchSubscription()
    }
    
    private func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard !text.isEmpty else {
                    self?.viewState = .empty
                    return
                }
                
                self?.searchLocations(for: text)
            }
            .store(in: &cancellables)
    }
    
    private func searchLocations(for query: String) {
        viewState = .loading
        // Fetch locations and update to .searchResults([WeatherData])
    }
    
    func selectLocation(_ weather: WeatherData) {
        viewState = .loaded(weather)
    }
}
