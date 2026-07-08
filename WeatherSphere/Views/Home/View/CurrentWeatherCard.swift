//
//  CurrentWeatherCard.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct CurrentWeatherCard: View {

    let weather: WeatherModel

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "location")
                Text(self.weather.location)
                    .font(.subheadline)
            }
            .foregroundColor(.primaryBlue) // Updated
            .padding(.top, 24)

            Image(systemName: "cloud.sun.fill")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)

            Text("\(weather.temperature)°")
                .font(.system(size: 72, weight: .bold))
                .foregroundColor(.textPrimary)
                .frame(width: 200, height: 50, alignment: .center)
                .padding(10)

            Text(weather.condition)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.textPrimary)

            HStack(spacing: 16) {
                VStack {
                    Text("HIGH")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.textSecondary) // Updated
                    Text("\(weather.high)°")
                        .fontWeight(.bold)
                        .foregroundColor(.textPrimary)
                }

                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.card) // Updated
                .cornerRadius(16)

                VStack {
                    Text("HIGH")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.textSecondary) // Updated
                    Text("\(weather.high)°")
                        .fontWeight(.bold)
                        .foregroundColor(.textPrimary)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.card) // Updated
                .cornerRadius(16)

            }
            .padding(.bottom, 24)
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors: [Color.cardBlue, Color.cardBlue.opacity(0.4)],
                                   startPoint: .top,
                                   endPoint: .bottom))
        .cornerRadius(15)
    }
}

#Preview {
    CurrentWeatherCard(weather: WeatherModel(location: "San Francisco, CA", temperature: 70, condition: "Mostly Sunny", high: 50, low: 70, hourlyForecast: [], details: WeatherDetails(windSpeed: 0, humidity: 0, uvIndex: 0, uvDescription: "", precipitation: 0)))
}
