//
//  RestaurantImage.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import SwiftUI

struct NetworkImage: View {
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image
                    .resizable()
            }  else if phase.error != nil  {
                VStack {
                    Image(foregroundColor(.gray) as! String)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("Error happen")
                        .font(.title2)
                    Text("Please try again.")
                        .font(.title3)
                }
                
            } else {
                ProgressView()
            }
        }
    }
}

struct RestaurantImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(imageUrl: Restaurant().imageUrl)
    }
}
