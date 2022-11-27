//
//  DetailsViewModel.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

final class NewsViewModel {
    private var news: News
    var image: String? {
        news.photoPath ?? ""
    }
    var titleLabel: String? {
        news.newsTitle
    }
    var textLabel: String? {
        news.newsText
    }
    var dateOfCreation: String? {
        news.newsDate ?? ""
    }
    var office: String? {
        news.office ?? ""
    }
    var tag: String? {
        news.tag ?? ""
    }
    
    required init(news: News) {
        self.news = news
    }
}

final class AttractionsViewModel {
    private var attraction: Attraction
    var image: String? {
        attraction.image
    }
    var titleLabel: String? {
        attraction.attractionTitle
    }
    var textLabel: String? {
        attraction.attractionDescriprion
    }
    var dateOfCreation: String? {
        attraction.dateOfCreation
    }
    
    required init(attraction: Attraction) {
        self.attraction = attraction
    }
}

final class MapPointsViewModel {
    private var mapPoints: Map
    var image: String? {
        mapPoints.photoPath
    }
    var titleLabel: String? {
        mapPoints.title
    }
    var textLabel: String? {
        mapPoints.text
    }
    var dateOfCreation: String? {
        mapPoints.dateOfCreation
    }
    
    required init(mapPoints: Map) {
        self.mapPoints = mapPoints
    }
}
