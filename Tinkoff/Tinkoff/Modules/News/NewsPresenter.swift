//
//  NewsPresenter.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

protocol NewsPresenting: AnyObject {
    var news: [News] { get set }
    var newsSearch: [News] { get set }
    func fillInNews()
    func pathNews(indexPath: IndexPath) -> DetailViewModelProtocol
}

final class NewsPresenter: NewsPresenting {
    var news: [News] = []
    var newsSearch: [News] = []
    weak var controller: NewsViewController?
    
    func fillInNews() {
        for _ in 0...10 {
            news.append(News(image: R.image.tinkoffIcon(),
                             newsTitle: "Title text",
                             newsText: "Full text"))
            newsSearch = news
        }
        self.controller?.reloadTable()
    }
    
    func pathNews(indexPath: IndexPath) -> DetailViewModelProtocol {
        return NewsViewModel(news: newsSearch[indexPath.row])
    }
}
