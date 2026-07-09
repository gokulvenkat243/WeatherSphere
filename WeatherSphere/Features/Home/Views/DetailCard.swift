//
//  DetailCard.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct DetailCard: View {

    let icon: String
    let title: String
    let value: String
    let unit: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .font(.caption)
            .foregroundColor(.textSecondary) // Updated

            HStack(alignment: .lastTextBaseline, spacing: 2) {
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.textPrimary) // Updated
                Text(unit)
                    .font(.subheadline)
                    .foregroundColor(.textPrimary) // Updated
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color.gray.opacity(0.05)) // Updated
        .cornerRadius(16)
    }
}

#Preview {
    DetailCard(icon: "wind", title: "WIND", value: "12", unit: "mph")
}
