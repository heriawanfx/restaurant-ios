//
//  RestaurantRow.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import SwiftUI

struct RestaurantRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            NetworkImage(imageUrl: restaurant.imageUrl)
                .frame(width: 50, height: 50)
            Text(restaurant.name)

            Spacer()

            if restaurant.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct RestaurantRow_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRow(restaurant: Restaurant())
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
