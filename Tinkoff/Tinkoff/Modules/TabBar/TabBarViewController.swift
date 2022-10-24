//
//  TabBarViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

final class TabBarViewController: UITabBarController {
    private let dataService: IDataService
    
    init(dataService: IDataService) {
        self.dataService = dataService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    private func createTabBar() {
        let newsVC = UINavigationController(rootViewController: NewsBuilder.build(dataService: dataService))
        let cateringVC = UINavigationController(rootViewController: CateringBuilder.build())
        let attractionVC = UINavigationController(rootViewController: AttractionsBuilder.build())
        newsVC.title = R.string.modules.newsTitleRus()
        cateringVC.title = R.string.modules.cateringTitleRus()
        attractionVC.title = R.string.modules.attractionTitleRus()
        self.setViewControllers([newsVC, cateringVC, attractionVC], animated: false)
        guard let items = self.tabBar.items else {
            return
        }
        let imagesNames = ["newspaper", "map", "building.columns"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: imagesNames[i])
        }
    }
}
