//
//  FavoriteScreen.swift
//  Restaurant
//
//  Created by user222008 on 6/18/22.
//

import SwiftUI

struct RestaurantFavoriteScreen: View {
    @EnvironmentObject var fetcher: RestaurantFetcher
    
    var favorites: [Restaurant] {
        fetcher.listResponse.restaurants.filter { item in
            item.isFavorite
        }        
    }

    var body: some View {
        NavigationView {
            ZStack {
                if favorites.isEmpty {
                    Text("Favourite restaurants is empty. Try adding it by click heart icon")
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List {
                        ForEach(favorites) { item in
                            NavigationLink(destination: {
                                RestaurantDetailScreen(restaurantId: item.id)
                            }, label: {
                                RestaurantRow(restaurant: item)
                            })
                        }
                    }
                }
            }
            
            .navigationTitle("Favorite")
        }
    }
}

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantFavoriteScreen()
            .environmentObject(RestaurantFetcher())
    }
}
