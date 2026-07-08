//
//  HomeView.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeWeatherViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()

                if let weather = viewModel.weather {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {
                            CurrentWeatherCard(weather: weather)
                            HourlyForecastSection(foreCast: weather.hourlyForecast)
                            WeatherDetailsSection(details: weather.details)
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                    }
                } else {
                    ProgressView()
                }
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack() {
                        Image(systemName: "bolt.square.fill")
                            .font(.title2)
                            .foregroundColor(.textPrimary)
                        Spacer(minLength: 80)

                        Text("SkyCast")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.textPrimary)
                        Spacer(minLength: 150)


                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
