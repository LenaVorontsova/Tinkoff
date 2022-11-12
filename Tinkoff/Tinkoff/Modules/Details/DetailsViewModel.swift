//
//  DetailsViewModel.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

final class NewsViewModel: DetailViewModelProtocol {
    private var news: News
    var image: String? {
        news.photoPath
    }
    var titleLabel: String? {
        news.newsTitle
    }
    var textLabel: String? {
        news.newsText
    }
    
    required init(news: News) {
        self.news = news
    }
}

final class AttractionsViewModel: DetailViewModelProtocol {
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
    
    required init(attraction: Attraction) {
        self.attraction = attraction
    }
}
