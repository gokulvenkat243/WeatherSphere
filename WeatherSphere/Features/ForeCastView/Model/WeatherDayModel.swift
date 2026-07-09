//
//  WeatherDayModel.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

struct WeatherDay: Identifiable {
    let id = UUID()
    let dayName: String
    let dateString: String
    let condition: String
    let conditionIcon: String
    let humidity: Int
    let highTemp: Int
    let lowTemp: Int
    let description: String
    var badgeText: String? = nil
}

