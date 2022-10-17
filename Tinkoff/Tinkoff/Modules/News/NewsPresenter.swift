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
}

final class NewsPresenter: NewsPresenting {
    var news: [News] = []
    var newsSearch: [News] = []
    weak var controller: NewsViewController?
    
    func fillInNews() {
        for _ in 0...10 {
            news.append(News(image: UIImage(named: "person.3"),
                             newsTitle: "Title",
                             newsText: "Text"))
            newsSearch = news
        }
        self.controller?.reloadTable()
    }
}
