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
    var image: UIImage? {
        news.image
    }
    var titleLabel: [String]? {
        var arr = [String]()
        arr.append(news.newsTitle ?? "")
        arr.append(news.newsText ?? "")
        return arr
    }
    
    required init(news: News) {
        self.news = news
    }
}

final class AttractionsViewModel: DetailViewModelProtocol {
    private var attraction: Attraction
    var image: UIImage? {
        UIImage(named: "tinkoffIcon")
    }
    var titleLabel: [String]? {
        var arr = [String]()
        arr.append(attraction.attractionTitle ?? "")
        arr.append(attraction.attractionDescriprion ?? "")
        arr.append(attraction.attractionAddress ?? "")
        return arr
    }
    
    required init(attraction: Attraction) {
        self.attraction = attraction
    }
}
