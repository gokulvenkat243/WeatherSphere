//
//  SearchView.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct SearchView: View {

    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {

                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search for a city...", text: $viewModel.searchText)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    if !viewModel.recentSearches.isEmpty {
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("RECENT SEARCHES")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)

                                Spacer()

                                Button(action: viewModel.clearRecentSearches) {
                                    Text("Clear All")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding(.horizontal)

                            ScrollView(showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(viewModel.recentSearches) { city in
                                        RecentSearchCard(city: city)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("POPULAR DESTINATIONS")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding()

                        VStack(spacing: 12) {
                            ForEach(viewModel.popularDestinations) { city in
                                PopularDestinationRow(city: city)
                            }
                        }
                        .padding(.horizontal)

                        Text("Showing \(viewModel.popularDestinations.count) locations.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 8)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Search Cities")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
