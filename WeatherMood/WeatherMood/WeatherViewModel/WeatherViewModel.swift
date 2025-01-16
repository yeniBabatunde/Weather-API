//
//  WeatherViewModel.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 15/01/2025.
//

import Foundation
import Combine

protocol IRepoWeatherViewModel {
    var searchText: String {get set}
    var errorMessage: String? { get set }
    var viewState: WeatherViewState {get set}
    func setupSearchSubscription()
    func searchLocations(for query: String)
    func selectLocation(_ weather: WeatherData)
}

class WeatherViewModel: ObservableObject, IRepoWeatherViewModel {
    
    @Published var searchText: String = ""
    @Published var viewState: WeatherViewState = .empty
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let userDefaultsHelper: UserDefaultsHelperProtocol
    fileprivate var weatherRepository: IWeatherRepository
    
    init(weatherRepository: IWeatherRepository,
         userDefaultsHelper: UserDefaultsHelperProtocol) {
        self.weatherRepository = weatherRepository
        self.userDefaultsHelper = userDefaultsHelper
        setupSearchSubscription()
        loadLastSelectedCity()
    }
    
    private func checkInitialState() {
        if let savedWeather: WeatherData = userDefaultsHelper.retrieve(
            WeatherData.self,
            for: Constants.UserDefaultsKeys.lastWeatherData
        ) {
            viewState = .loaded(savedWeather)
        } else {
            viewState = .empty
        }
    }
    
    func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                
                if text.isEmpty {
                    if let savedWeather: WeatherData = userDefaultsHelper.retrieve(
                        WeatherData.self,
                        for: Constants.UserDefaultsKeys.lastWeatherData
                    ) {
                        viewState = .loaded(savedWeather)
                    } else {
                        viewState = .empty
                    }
                    return
                }
                if text.count >= 3 {
                    self.searchLocations(for: text)
                }
            }
            .store(in: &cancellables)
    }
    
    func searchLocations(for query: String) {
        viewState = .loading
        
        weatherRepository.getWeatherMoodByLocation(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if [data].isEmpty || data.current == nil {
                    viewState = .searchDataEmpty
                } else {
                    viewState = .searchResults([data])
                }
            case .failure(let error):
                viewState = .error
                errorMessage = error.localizedDescription
            }
        }
    }
    
    private func saveSelectedCity(_ weather: WeatherData) {
        if let imageUrl = weather.current?.condition?.imageIconURL,
           let url = URL(string: imageUrl) {
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    var weatherWithImage = weather
                    weatherWithImage.current?.condition?.imageData = data
                    userDefaultsHelper.save(weatherWithImage, for: Constants.UserDefaultsKeys.lastWeatherData)
                } catch {
                    userDefaultsHelper.save(weather, for: Constants.UserDefaultsKeys.lastWeatherData)
                }
            }
        } else {
            userDefaultsHelper.save(weather, for: Constants.UserDefaultsKeys.lastWeatherData)
        }
    }
    
    private func loadLastSelectedCity() {
        if let savedWeather: WeatherData = userDefaultsHelper.retrieve(
            WeatherData.self,
            for: Constants.UserDefaultsKeys.lastWeatherData
        ) {
            viewState = .loaded(savedWeather)
        } else {
            viewState = .empty
        }
    }
    
    func selectLocation(_ weather: WeatherData) {
        viewState = .loaded(weather)
        saveSelectedCity(weather)
    }
    
}
