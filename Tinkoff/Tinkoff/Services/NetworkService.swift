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
    var baseURL = "http://92.55.39.194:5000/api/"
    
    func getInfoNews(endPoint: String,
                     completion: @escaping (Result<Response<[NewsNetwork]>, AFError>) -> Void) {
        AF.request(baseURL + endPoint,
                   method: .get)
        .responseDecodable(of: Response<[NewsNetwork]>.self) { response in
            completion(response.result)
        }
    }
    
    func getInfoAttractions(endPoint: String,
                            completion: @escaping (Result<Response<[AttractionNetwork]>, AFError>) -> Void) {
        AF.request(
            baseURL + endPoint,
            method: .get)
            .responseDecodable(of: Response<[AttractionNetwork]>.self) { response in
                completion(response.result)
            }
    }
}
