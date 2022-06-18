//
//  Restaurant.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import Foundation

struct RestaurantListResponse: Codable{
    var error: Bool = false
    var message: String = "success"
    var count: Int = 0
    var restaurants: [Restaurant] = [Restaurant()]
}

struct RestaurantDetailResponse: Codable {
    var error: Bool = false
    var message: String = "success"
    var restaurant: Restaurant = Restaurant()
}
