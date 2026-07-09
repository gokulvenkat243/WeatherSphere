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
                Image(systemName: day.conditionIcon)
                    .font(.system(size: 32))
                    .frame(width: 60, height: 60)
                    .foregroundColor(iconColor(for: day.conditionIcon))
                    .background(.gray.opacity(0.08))
                    .cornerRadius(18)

                VStack(alignment: .leading, spacing: 4) {
                    Text(day.condition)
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    HStack(spacing: 4) {
                        Image(systemName: "thermometer")
                            .foregroundColor(.secondary)
                        Text("Humidity: \(day.humidity)%")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.leading, 8)

                Spacer()

                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text("\(day.highTemp)°")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(day.lowTemp)°")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
            }

            Divider()

            Text(day.description)
                .font(.footnote)
                .foregroundColor(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(UIColor.systemGray5), lineWidth: 1)
        )
    }

    private func iconColor(for icon: String) -> Color {
        switch icon {
        case "sun.max", "cloud.sun": return .orange
        case "wind": return .teal
        default: return .gray
        }
    }
}

#Preview {
    WeatherDayCard(day: WeatherDay(dayName: "Today", dateString: "OCT 23", condition: "Partly Cloudy", conditionIcon: "cloud.sun", humidity: 45, highTemp: 72, lowTemp: 58, description: "A mix of sun and clouds throughout the day. Perfect for a walk.", badgeText: "Most Comfortable"))
}
