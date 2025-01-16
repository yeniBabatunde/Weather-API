//
//  WeatherRepoDIContainer.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

class WeatherRepoDIContainer {
  
    static let sharedInstance = WeatherRepoDIContainer()
    
    func makeWeatherMoodRepo() -> WeatherViewModel {
        let weatherRepository = WeatherRepository(remoteDataSource: RemoteNetworkService())
        let userdefaultHelper = UserDefaultsHelper()
        return WeatherViewModel(weatherRepository: weatherRepository, userDefaultsHelper: userdefaultHelper)
    }
}
