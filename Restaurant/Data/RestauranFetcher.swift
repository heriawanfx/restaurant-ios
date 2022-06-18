//
//  RestauranFetcher.swift
//  Restaurant
//
//  Created by user222008 on 6/16/22.
//

import Foundation

class RestaurantFetcher: ObservableObject {
    @Published var listResponse = RestaurantListResponse()
    @Published var detailResponse = RestaurantDetailResponse()
            
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    func fetchList() async
    throws  {
        let urlList = "\(Constant.BASE_URL)\(Constant.PATH_LIST)"
        guard let url = URL(string: "\(urlList)") else {
            print("Invalid url: \(urlList)")
            return
            
        }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        Task { @MainActor in
            do {
                let decoder = JSONDecoder()
                listResponse = try decoder.decode(RestaurantListResponse.self, from: data)
            } catch {
                fatalError("Couldn't parse \(urlList) as \(RestaurantListResponse.self):\n\(error)")
            }
            
        }
    }
        
    func fetchDetail(_ id: String) async
    throws  {
        let urlDetail = "\(Constant.BASE_URL)\(Constant.PATH_DETAIL)\(id)"
        guard let url = URL(string: "\(urlDetail)") else { return }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        Task { @MainActor in
            do {
                let decoder = JSONDecoder()
                detailResponse = try decoder.decode(RestaurantDetailResponse.self, from: data)
            } catch {
                fatalError("Couldn't parse \(urlDetail) as \(RestaurantDetailResponse.self):\n\(error)")
            }
        }
    }

    
}
