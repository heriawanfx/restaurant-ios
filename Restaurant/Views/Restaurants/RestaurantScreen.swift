//
//  RestaurantList.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import SwiftUI

struct RestaurantScreen: View {
    @EnvironmentObject var fetcher: RestaurantFetcher

    var filteredList: [Restaurant] {
        fetcher.listResponse.restaurants
        
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredList) { item in
                    NavigationLink(destination: {
                        RestaurantDetailScreen(restaurantId: item.id)
                        }, label: {
                            RestaurantRow(restaurant: item)
                        }
                    )
                }
            }
            .task {
                try? await fetcher.fetchList()
            }
            .navigationTitle("Restaurants")
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantScreen()
            .environmentObject(RestaurantFetcher())
    }
}
