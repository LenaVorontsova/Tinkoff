//
//  Attraction.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

struct AttractionNetwork: Decodable {
    var image: String?
    var attractionTitle: String?
    var attractionDescriprion: String?
    var attractionAddress: String?
}

struct Attraction {
    var image: String?
    var attractionTitle: String?
    var attractionDescriprion: String?
    var attractionAddress: String?
}
