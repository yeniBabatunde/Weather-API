//
//  WeatherRepository.swift
//  WeatherMood
//
//  Created by Sharon Omoyeni Babatunde on 16/01/2025.
//

import Foundation

protocol IWeatherRepository {
    func getWeatherMoodByLocation(query: String?, completion: @escaping (Result<WeatherData, Error>) -> Void)
}

class WeatherRepository: IWeatherRepository {
    
    fileprivate var remoteDataSource: INetworkService
    
    init(remoteDataSource: INetworkService) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getWeatherMoodByLocation(query: String?, completion: @escaping (Result<WeatherData, any Error>) -> Void) {
        let baseURL = Constants.ApiHelper.baseURL
        let route = Route.weatherFeel.description
        var parameter = Parameters()
        parameter["key"] = Constants.ApiHelper.authorizationKey
        parameter["q"] = query ?? ""
        
        remoteDataSource.fetch(baseUrl: baseURL, route: route, method: .get, type: WeatherData.self, parameters: parameter) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
                Logger.printIfDebug(data: "\(success)", logType: .success)
            case .failure(let failure):
                Logger.printIfDebug(data: "Error: \(failure)", logType: .error)
                completion(.failure(failure))
            }
        }
    }
    
    
}
