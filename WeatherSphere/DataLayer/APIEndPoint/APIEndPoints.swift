//
//  APIEndPoints.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

struct APIEndPoints {

    static let baseUrl = "https://api.weatherapi.com/v1"
    static let apiKey = "7a9beb1ee6c84dc693250500260907"

    // We use this endpoint to get current weather, daily highs/lows, and hourly data in one call
    static func getForscast(query: String, days: Int = 1) -> String {
        let safeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        return "\(baseUrl)/forecast.json?key=\(apiKey)&q=\(safeQuery)&days=\(days)&aqi=no&alerts=no"
    }
}
