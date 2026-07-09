//
//  SearchModel.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation
import SwiftUI

enum WeatherCondition: String {
    case cloudy = "Cloudy"
    case sunny = "Sunny"
    case rainy = "Rainy"
    case stormy = "Stormy"

    var iconName: String {
        switch self {
        case .cloudy: return "cloud"
        case .sunny: return "sun.max"
        case .rainy: return "cloud.rain"
        case .stormy: return "cloud.bolt"
        }
    }
}

struct CityWeather: Identifiable {
    let id = UUID()
    let name: String
    let temperature: Int
    let countryCode: String?
    let time: String?
    let condition: WeatherCondition?
}
