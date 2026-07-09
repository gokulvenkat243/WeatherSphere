//
//  WeatherDetailsSection.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct WeatherDetailsSection: View {

    let details: WeatherDetails

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("WEATHER DETAILS")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.textSecondary)

            LazyVGrid(columns: columns, spacing: 16) {
                DetailCard(icon: "wind", title: "WIND", value: "\(details.windSpeed)", unit: "mph")
                DetailCard(icon: "drop", title: "HUMIDITY", value: "\(details.humidity)", unit: "%")
                DetailCard(icon: "sun.max", title: "UV INDEX", value: "\(details.uvIndex)", unit: details.uvDescription)
                DetailCard(icon: "umbrella", title: "PRECIPITATION", value: "\(details.precipitation)", unit: "mm")
            }
        }
    }
}

#Preview {
    WeatherDetailsSection(details: WeatherDetails(
        windSpeed: 12,
        humidity: 45,
        uvIndex: 4,
        uvDescription: "Moderate",
        precipitation: 0
    ))
}
