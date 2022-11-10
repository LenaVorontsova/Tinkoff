//
//  NetworkService.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 23.10.2022.
//

import Foundation
import UIKit
import Alamofire

final class NetworkService {
    var baseURL = "http://217.114.156.125:5000/api"
    
    func getInfoNews(endPoint: String,
                     completion: @escaping (Result<NewsNetwork, Error>) -> Void) {
        AF.request(baseURL + "/" + endPoint,
                   method: .get)
        .responseData(completionHandler: { data in
            do {
                guard let newData = data.data else { return }
                let newsNetwork = try JSONDecoder().decode(NewsNetwork.self, from: newData)
                completion(.success(newsNetwork))
            } catch {
                completion(.failure(error))
            }
        })
    }
    
    func getInfoMapPoints(endPoint: String,
                          completion: @escaping (Result<MapNetwork, Error>) -> Void) {
        AF.request(baseURL + "/" + endPoint,
                   method: .get)
        .responseData(completionHandler: { data in
            do {
                guard let newData = data.data else { return }
                let mapPointNetwork = try JSONDecoder().decode(MapNetwork.self, from: newData)
                completion(.success(mapPointNetwork))
            } catch {
                completion(.failure(error))
            }
        })
    }
}
