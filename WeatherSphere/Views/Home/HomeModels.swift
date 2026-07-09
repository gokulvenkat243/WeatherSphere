//
//  HomeModels.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import Foundation

struct CurrentWeather {
    let location: String
    let temperature: Int
    let condition: String
    let high: Int
    let low: Int
}

struct HourlyForecast: Identifiable {
    let id = UUID()
    let time: String
    let iconName: String
    let temperature: Int
    let isCurrent: Bool
}

struct WeatherDetails {
    let windSpeed: Int
    let humidity: Int
    let uvIndex: Int
    let uvDescription: String
    let precipitation: Int
}
