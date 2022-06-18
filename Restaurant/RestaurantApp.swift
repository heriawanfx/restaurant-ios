//
//  RestaurantApp.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import SwiftUI

@main
struct RestaurantApp: App {   
    var body: some Scene {
        WindowGroup {
            ContentView(fetcher: RestaurantFetcher())
        }
    }
}
