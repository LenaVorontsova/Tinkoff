//
//  SplashScreenPresenter.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

protocol SplashScreenPresenting: AnyObject {
    var controller: SplashScreenViewController? { get set }
    func showTabBar()
    func getInfo()
}

final class SplashScreenPresenter: SplashScreenPresenting {
    let network: NetworkService
    let dataService: IDataService
    weak var controller: SplashScreenViewController?
    
    init(network: NetworkService, dataService: IDataService) {
        self.network = network
        self.dataService = dataService
    }
    
    func getInfo() {
        dataService.loadData()
        self.showTabBar()
    }
    
    func showTabBar() {
        let tabBarVC = TabBarViewController(dataService: dataService)
        tabBarVC.modalPresentationStyle = .fullScreen
        controller?.present(tabBarVC, animated: false)
    }
}
