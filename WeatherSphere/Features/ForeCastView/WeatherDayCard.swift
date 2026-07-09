//
//  WeatherDayCard.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import SwiftUI

struct WeatherDayCard: View {

    let day: WeatherDay

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(day.dayName)
                        .font(.headline)
                        .fontWeight(.bold)

                    Text(day.dateString)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                if let badge = day.badgeText {
                    Text(badge)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)

                }
            }

            HStack {

            }
        }
    }
}

#Preview {
    WeatherDayCard(day: WeatherDay(dayName: "Today", dateString: "OCT 23", condition: "Partly Cloudy", conditionIcon: "cloud.sun", humidity: 45, highTemp: 72, lowTemp: 58, description: "A mix of sun and clouds throughout the day. Perfect for a walk.", badgeText: "Most Comfortable"))
}
