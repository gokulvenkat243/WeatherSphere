//
//  WeatherRepository.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

protocol WeatherRepository {
    func fetchWeather(for city: String, completion: @escaping (Result<ApiWeatherResponse, Error>) -> Void)
}

class DefaultWeatherRepository: WeatherRepository {
    private let dataTransferService: DataTransferService

    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }

    func fetchWeather(for city: String, completion: @escaping (Result<ApiWeatherResponse, Error>) -> Void) {
        let urlPath = APIEndPoints.getForscast(query: city, days: 2)

        dataTransferService.request(url: urlPath) { (result: Result<ApiWeatherResponse, Error>) in
            completion(result)
        }
    }
}
