//
//  ContentView.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fetcher: RestaurantFetcher
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, favorite, about
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RestaurantScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            RestaurantFavoriteScreen()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
                .tag(Tab.favorite)
            AboutScreen()
                .tabItem {
                    Label("About", systemImage: "gear")
                }
                .tag(Tab.about)            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        
        ContentView(fetcher: RestaurantFetcher())
            .environmentObject(RestaurantFetcher())
    }
}
