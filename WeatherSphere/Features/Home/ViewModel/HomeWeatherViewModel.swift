//
//  HomeWeatherViewModel.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//


import Foundation

class HomeWeatherViewModel: ObservableObject {
    @Published var currentWeather: CurrentWeather?
    @Published var hourlyForecast: [HourlyForecast] = []
    @Published var weatherDetails: WeatherDetails?

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let repository: WeatherRepository

    init(repository: WeatherRepository = DefaultWeatherRepository(dataTransferService: DefaultDataTransferService())) {
        self.repository = repository
        // Set your default city here
        self.fetchWeather(city: "Chennai")
    }

    func fetchWeather(city: String) {
        self.errorMessage = nil

        repository.fetchWeather(for: city) { [weak self] result in
            guard let self = self else {
                return
            }

            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.currentWeather = success.extractCurrentWeather()
                    self.hourlyForecast = success.extractHourlyForecast()
                    self.weatherDetails = success.extractWeatherDetails()
                    self.isLoading = true
                case .failure(let failure):
                    self.errorMessage = failure.localizedDescription
                }
            }
        }
    }
}
