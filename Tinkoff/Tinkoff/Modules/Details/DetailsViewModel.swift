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

final class AttractionsViewModel {
    private var attraction: Attraction
    var image: UIImage? {
        R.image.tinkoffIcon()
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
