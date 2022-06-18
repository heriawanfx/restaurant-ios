//
//  FavoriteButton.swift
//  Restaurant
//
//  Created by user222008 on 6/18/22.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button(action: {
            isSet.toggle()            
        }, label: {
                Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .red : .gray)
            }
        )
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
