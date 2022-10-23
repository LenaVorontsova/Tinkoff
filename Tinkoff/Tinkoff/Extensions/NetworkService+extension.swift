//
//  NetworkService+extension.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 23.10.2022.
//

import Foundation

extension NetworkService {
    struct Response<T: Decodable>: Decodable {
        let results: T
    }
}
