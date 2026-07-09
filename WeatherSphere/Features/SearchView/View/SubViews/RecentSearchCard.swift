//
//  RecentSearchCard.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import SwiftUI

struct RecentSearchCard: View {

    let city: CityWeather

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: "clock")
                .foregroundColor(.blue)
                .padding(8)
                .background(Color.blue.opacity(0.1))
                .clipShape(.circle)

            VStack(alignment: .leading, spacing: 4) {
                Text(city.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text("\(city.temperature)°C")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 110, alignment: .leading)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )

    }
}

#Preview {
    RecentSearchCard(city: CityWeather(name: "London", temperature: 18, countryCode: nil, time: nil, condition: nil))
}
