//
//  RestaurantDetailScreen.swift
//  Restaurant
//
//  Created by user222008 on 6/17/22.
//

import SwiftUI

struct RestaurantDetailScreen: View {
    var restaurantId: String
    
    @EnvironmentObject var fetcher : RestaurantFetcher
    
    var restaurant: Restaurant {
        fetcher.detailResponse.restaurant
    }
    
    private var selectedIndex: Int {
        fetcher.listResponse.restaurants.firstIndex(where: {
            $0.id == restaurantId
        })!
    }
    
    
    var body: some View {
        ScrollView {
            NetworkImage(imageUrl: restaurant.imageUrl)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            VStack(alignment: .leading) {
                HStack {
                    Text(restaurant.name)
                        .font(.title)
                    FavoriteButton(isSet: $fetcher.listResponse.restaurants[selectedIndex].isFavorite)
                }

                Text(restaurant.city)
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text(restaurant.description)
            }
            .padding()
        }
        .task {
            try? await fetcher.fetchDetail(restaurantId)
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RestaurantDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailScreen(restaurantId: Restaurant().id)
            .environmentObject(RestaurantFetcher())
    }
}
