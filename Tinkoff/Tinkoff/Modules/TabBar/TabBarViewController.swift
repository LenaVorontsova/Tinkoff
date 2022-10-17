//
//  TabBarViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    private func createTabBar() {
        let newsVC = UINavigationController(rootViewController: NewsBuilder.build())
        let cateringVC = UINavigationController(rootViewController: CateringBuilder.build())
        let attractionVC = UINavigationController(rootViewController: AttractionsBuilder.build())
        newsVC.title = "Новости"
        cateringVC.title = "Питание"
        attractionVC.title = "Достопримечательности"
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
