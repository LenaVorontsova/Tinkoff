//
//  News.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

struct NewsNetwork: Decodable {
    var image: String?
    var newsTitle: String?
    var newsText: String?
}

struct News {
    var image: UIImage?
    var newsTitle: String?
    var newsText: String?
}
