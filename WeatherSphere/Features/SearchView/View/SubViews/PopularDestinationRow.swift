//
//  PopularDestinationRow.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import SwiftUI

struct PopularDestinationRow: View {

    let city: CityWeather

    var body: some View {
        HStack(spacing: 16) {

            if let condition = city.condition {
                Image(systemName: condition.iconName)
                    .font(.title2)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(.circle)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack() {
                    Text(city.name)
                        .font(.headline)
                    Image("locationIcon")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.blue)
                }

                if let country = city.countryCode, let time = city.time {
                    Text("\(country) • \(time)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 5) {
                Text("\(city.temperature)°")
                    .font(.title2)
                    .fontWeight(.bold)

                if let condition = city.condition {
                    Text(condition.rawValue)
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
            }

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.caption)
                .padding()
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    PopularDestinationRow(city: CityWeather(name: "San Francisco", temperature: 16, countryCode: "US", time: "10:42 AM", condition: .cloudy))
}
