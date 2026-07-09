//
//  ForecastViewModel.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

class ForecastViewModel: ObservableObject {
    @Published var forecast: [WeatherDay] = []
    @Published var weeklyInsight: String = "Overall, the week remains mild with a slight cooling trend towards the weekend. Expect the most rainfall on Tuesday. Visibility will be excellent except during Wednesday's high winds."

    init() {
        loadMockData()
    }

    private func loadMockData() {
        forecast = [
            WeatherDay(dayName: "Today", dateString: "OCT 23", condition: "Partly Cloudy", conditionIcon: "cloud.sun", humidity: 45, highTemp: 72, lowTemp: 58, description: "A mix of sun and clouds throughout the day. Perfect for a walk.", badgeText: "Most Comfortable"),
            WeatherDay(dayName: "Monday", dateString: "OCT 24", condition: "Showers", conditionIcon: "cloud.rain", humidity: 45, highTemp: 68, lowTemp: 55, description: "Intermittent rain showers expected in the morning. Carry an umbrella."),
            WeatherDay(dayName: "Tuesday", dateString: "OCT 25", condition: "Thunderstorms", conditionIcon: "cloud.bolt.rain", humidity: 45, highTemp: 65, lowTemp: 52, description: "High chance of heavy rain and thunder late in the afternoon."),
            WeatherDay(dayName: "Wednesday", dateString: "OCT 26", condition: "Windy", conditionIcon: "wind", humidity: 45, highTemp: 70, lowTemp: 56, description: "Clear skies but strong gusty winds from the northwest."),
            WeatherDay(dayName: "Thursday", dateString: "OCT 27", condition: "Sunny", conditionIcon: "sun.max", humidity: 45, highTemp: 74, lowTemp: 60, description: "Bright sunny skies all day. UV index will be high around noon."),
            WeatherDay(dayName: "Friday", dateString: "OCT 28", condition: "Cloudy", conditionIcon: "cloud", humidity: 45, highTemp: 62, lowTemp: 48, description: "Dense cloud cover with cool breeze. No precipitation expected."),
            WeatherDay(dayName: "Saturday", dateString: "OCT 29", condition: "Light Rain", conditionIcon: "cloud.drizzle", humidity: 45, highTemp: 58, lowTemp: 44, description: "Chilly morning followed by light drizzle throughout the day.")
        ]
    }
}
