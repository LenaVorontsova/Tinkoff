//
//  MapPoints.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 06.11.2022.
//

import Foundation
import UIKit

struct Map {
    var lat: String?
    var lng: String?
    var title: String?
    var text: String?
    var mapPointType: String?
    var photoPath: String?
    var dateOfCreation: String?
}

struct MapElemenet: Codable {
    let id: Int?
    let lat, lng: String?
    let cityInstance: CityInstance?
    let title, text, photoPath: String?
    let likes, disLikes: Int?
    let tinkoffCashBack: Bool?
    let comments, dateOfCreation: String?
    let mapPointType: MapPointType?
}

struct CityInstance: Codable {
    let id: Int?
    let name: String?
}

struct MapPointType: Codable {
    let id: Int?
    let mapPointType: String?
}

typealias MapNetwork = [MapElemenet]
