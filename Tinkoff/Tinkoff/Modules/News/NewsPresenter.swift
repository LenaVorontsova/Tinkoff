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
    func pathNews(indexPath: IndexPath) -> NewsViewModel
    func loadData()
}

final class NewsPresenter: NewsPresenting {
    var news: [News] = []
    var newsSearch: [News] = []
    weak var controller: NewsViewController?
    let dataService: IDataService
    
    init(dataService: IDataService) {
        self.dataService = dataService
    }
    
    func loadData() {
        dataService.loadData()
        self.news = self.dataService.fetchNewsFromCoreData()
        self.newsSearch = self.news
        self.controller?.reloadTable()
    }
    
    func pathNews(indexPath: IndexPath) -> NewsViewModel {
        return NewsViewModel(news: newsSearch[indexPath.section])
    }
}
