//
//  News.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

struct News {
    var photoPath: UIImage?
    var newsTitle: String?
    var newsText: String?
}

// MARK: - NewsNetrorkElement
struct NewsNetworkElement: Codable {
    let id: Int?
    let title, text, photoPath: String?
    let office: Office?
    let tag: Tag?
    let dateOfCreation: String?
}

struct Office: Codable {
    let id, city: Int?
    let adress: String?
}

struct Tag: Codable {
    let id: Int?
    let tag: String?
}

typealias NewsNetwork = [NewsNetworkElement]
