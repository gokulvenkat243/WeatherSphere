//
//  HourlyCard.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct HourlyCard: View {

    let foreCast: HourlyForecast

    var body: some View {
        VStack(spacing: 12) {
            Text(foreCast.time)
                .font(.subheadline)
                .fontWeight(foreCast.isCurrent ? .bold : .regular)

            Image(systemName: foreCast.iconName)
                .foregroundColor(foreCast.isCurrent ? .white : .textPrimary)
                .font(.title2)

            Text("\(foreCast.temperature)°")
                .font(.headline)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)

        .background(foreCast.isCurrent ? Color.primaryBlue : Color.card)
        .foregroundColor(foreCast.isCurrent ? .white : .textPrimary)
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.textSecondary.opacity(0.3), lineWidth: foreCast.isCurrent ? 0 : 1)

        }
    }
}
