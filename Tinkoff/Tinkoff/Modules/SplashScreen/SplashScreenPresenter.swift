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
    weak var controller: SplashScreenViewController?
    
    func getInfo() {
        self.showTabBar()
    }
    
    func showTabBar() {
//        let tabBarVC = TabBarViewController()
//        tabBarVC.modalPresentationStyle = .fullScreen
//        controller?.present(tabBarVC, animated: false)
    }
}
