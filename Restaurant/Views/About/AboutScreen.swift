//
//  AboutScreen.swift
//  Restaurant
//
//  Created by user222008 on 6/18/22.
//

import SwiftUI

struct AboutScreen: View {
    private var avatarUrl = "https://avatars.githubusercontent.com/u/35026590"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Text("This app built with SwiftUI to fullfill project submission at Dicoding")
                    .multilineTextAlignment(.center)
                
                Text("by")
                    .padding(.all)
                
                NetworkImage(imageUrl: avatarUrl)
                    .cornerRadius(25)
                    .frame(width: 50, height: 50)
                Text("Heri Setiawan")
            }
            .padding()
            .navigationTitle("About")
        }
        
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
