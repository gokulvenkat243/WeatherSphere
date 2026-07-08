//
//  HomeWeatherViewModel.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//


import Foundation

class HomeWeatherViewModel: ObservableObject {
    @Published var weather: WeatherModel?

    init() {
        loadMockData()
    }

    // Simulating a network fetch
    private func loadMockData() {
        let hourly = [
            HourlyForecast(time: "Now", iconName: "cloud.sun.fill", temperature: 72, isCurrent: true),
            HourlyForecast(time: "2 PM", iconName: "sun.max.fill", temperature: 74, isCurrent: false),
            HourlyForecast(time: "3 PM", iconName: "sun.max.fill", temperature: 75, isCurrent: false),
            HourlyForecast(time: "4 PM", iconName: "cloud.sun.fill", temperature: 73, isCurrent: false),
            HourlyForecast(time: "5 PM", iconName: "cloud.sun.fill", temperature: 71, isCurrent: false)
        ]

        let details = WeatherDetails(
            windSpeed: 12,
            humidity: 45,
            uvIndex: 4,
            uvDescription: "Moderate",
            precipitation: 0
        )

        self.weather = WeatherModel(
            location: "San Francisco, CA",
            temperature: 72,
            condition: "Mostly Sunny",
            high: 78,
            low: 64,
            hourlyForecast: hourly,
            details: details
        )
    }
}
