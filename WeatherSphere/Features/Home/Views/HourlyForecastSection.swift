//
//  HourlyForecastSection.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct HourlyForecastSection: View {

    let foreCast: [HourlyForecast]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("HOURLY FORECAST")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.textSecondary)

                Spacer()

                Text("Next 24 Hours")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.primaryBlue) // Updated
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.primaryBlue.opacity(0.1)) // Updated
                    .cornerRadius(12)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(foreCast) { cast in
                        HourlyCard(foreCast: cast)
                    }
                }
            }
        }

    }
}

#Preview {
    HourlyForecastSection(foreCast: [
        HourlyForecast(time: "Now", iconName:"cloud.sun.fill", temperature: 72, isCurrent: true),
                          HourlyForecast(time: "1 PM", iconName: "sun.max.fill", temperature: 74, isCurrent: false),
                          HourlyForecast(time: "2 PM", iconName: "sun.max.fill", temperature: 75, isCurrent: false),
                          HourlyForecast(time: "3 PM", iconName: "cloud.sun.fill", temperature: 73, isCurrent: false),
                          HourlyForecast(time: "4 PM", iconName: "cloud.sun.fill", temperature: 71, isCurrent: false),
        HourlyForecast(time: "5 PM", iconName: "sun.max.fill", temperature: 74, isCurrent: false),
        HourlyForecast(time: "6 PM", iconName: "sun.max.fill", temperature: 75, isCurrent: false),
        HourlyForecast(time: "7 PM", iconName: "cloud.sun.fill", temperature: 73, isCurrent: false),
        HourlyForecast(time: "8 PM", iconName: "cloud.sun.fill", temperature: 71, isCurrent: false)
    ])
}
