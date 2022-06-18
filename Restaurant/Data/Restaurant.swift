//
//  Restaurant.swift
//  Restaurant
//
//  Created by user222008 on 6/18/22.
//

import Foundation

struct Restaurant: Codable, Hashable, Identifiable {
    var id: String = "rqdv5juczeskfw1e867"
    var name: String = "Nama Resto"
    var description: String = "Deskripti"
    var pictureId: String = "14"
    var city: String = "Kota"
    var rating: Double = 4.5
    var categories: [Category]? = []
    
    enum CodingKeys: CodingKey {
        case id, name, description, pictureId, city, rating, categories
    }
    
    var imageUrl: String {
        "\(Constant.IMAGE_URL)\(pictureId)"
    }
    
    var isFavorite: Bool = false
}

struct Category: Codable, Hashable {
    var name: String
}
