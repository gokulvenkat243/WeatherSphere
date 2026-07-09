//
//  ForecastView.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct ForecastView: View {

    @StateObject private var viewModel = ForecastViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("COMING WEEK OUTLOOK")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)

                        Spacer()

                        HStack(spacing: 4) {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 6, height: 6)
                            Text("Live Updates")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.forecast) { day in
                            WeatherDayCard(day: day)
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "sun.haze")
                                .foregroundColor(.blue)
                            Text("Weekly Insight")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }

                        Text(viewModel.weeklyInsight)
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.darkGray))
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.05))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
            }

            .navigationTitle("7-Day Forecast")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "calendar")
                    }
                }
            }
        }
    }
}

#Preview {
    ForecastView()
}

//import SwiftUI
//
//struct SearchView: View {
//
//    @StateObject private var viewModel = SearchViewModel()
//
//    var body: some View {
//        NavigationView {
//            ScrollView(showsIndicators: false) {
//                VStack(spacing: 18) {
//
//                    HStack{
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                        TextField("Search for a city...", text: $viewModel.searchText)
//                    }
//                    .padding()
//                    .background(Color.gray.opacity(0.05))
//                    .cornerRadius(12)
//                    .padding(.horizontal)
//
//                    if !viewModel.recentSearches.isEmpty {
//                        VStack(alignment: .leading, spacing: 14) {
//                            HStack {
//                                Text("RECENT SEARCHES")
//                                    .font(.subheadline)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.gray)
//
//                                Spacer()
//
//                                Button(action: viewModel.clearRecentSearches) {
//                                    Text("Clear All")
//                                        .font(.subheadline)
//                                        .fontWeight(.semibold)
//                                        .foregroundColor(.blue)
//                                }
//                            }
//                            .padding(.horizontal)
//
//                            ScrollView(showsIndicators: false) {
//                                HStack(spacing: 12) {
//                                    ForEach(viewModel.recentSearches) { city in
//                                        RecentSearchCard(city: city)
//                                    }
//                                }
//                                .padding(.horizontal)
//                            }
//                        }
//                    }
//
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("POPULAR DESTINATIONS")
//                            .font(.subheadline)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.gray)
//                            .padding()
//
//                        VStack(spacing: 12) {
//                            ForEach(viewModel.popularDestinations) { city in
//                                PopularDestinationRow(city: city)
//                            }
//                        }
//                        .padding(.horizontal)
//
//                        Text("Showing \(viewModel.popularDestinations.count) locations.")
//                            .font(.footnote)
//                            .foregroundColor(.gray)
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .padding(.top, 8)
//                    }
//                }
//                .padding(.vertical)
//            }
//            .navigationTitle("Search Cities")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//#Preview {
//    SearchView()
//}
