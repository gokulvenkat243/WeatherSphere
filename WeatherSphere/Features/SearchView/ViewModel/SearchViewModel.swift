//
//  SearchViewModel.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""

    @Published var recentSearches: [CityWeather] = [
        CityWeather(name: "London", temperature: 18, countryCode: nil, time: nil, condition: nil),
        CityWeather(name: "New York", temperature: 24, countryCode: nil, time: nil, condition: nil),
        CityWeather(name: "Tokyo", temperature: 21, countryCode: nil, time: nil, condition: nil)
    ]

    @Published var popularDestinations: [CityWeather] = [
        CityWeather(name: "San Francisco", temperature: 16, countryCode: "US", time: "10:42 AM", condition: .cloudy),
        CityWeather(name: "Santa Monica", temperature: 22, countryCode: "US", time: "10:42 AM", condition: .sunny),
        CityWeather(name: "Santiago", temperature: 12, countryCode: "CL", time: "1:42 PM", condition: .rainy),
        CityWeather(name: "Santorini", temperature: 26, countryCode: "GR", time: "7:42 PM", condition: .sunny),
        CityWeather(name: "São Paulo", temperature: 20, countryCode: "BR", time: "2:42 PM", condition: .stormy)
    ]

    func clearRecentSearches() {
        recentSearches.removeAll()
    }
}
