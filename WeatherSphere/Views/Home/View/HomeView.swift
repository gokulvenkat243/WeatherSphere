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

                if viewModel.isLoading && viewModel.currentWeather == nil {
                    ProgressView("Fetching Weather...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        Text(error)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Retry") {
                            viewModel.fetchWeather(city: "Chennai")
                        }
                    }
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {

                            if let currentData = viewModel.currentWeather {
                                CurrentWeatherCard(weather: currentData)
                            }

                            if !viewModel.hourlyForecast.isEmpty {
                                HourlyForecastSection(foreCast: viewModel.hourlyForecast)
                            }

                            if let details = viewModel.weatherDetails {
                                WeatherDetailsSection(details: details)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                    }
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
