//
//  MainTabView.swift
//  WeatherSphere
//
//  Created by gokul v on 08/07/26.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedTab = 0

    var body: some View {

        TabView(selection: $selectedTab) {

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)

            ForecastView()
                .tabItem {
                    Label("Forecast", systemImage: "cloud.rain")
                }
                .tag(2)

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(3)
        }
        .environment(\.symbolVariants, .none)
        .tint(.blue.opacity(0.7))
    }
}

#Preview {
    MainTabView()
}
