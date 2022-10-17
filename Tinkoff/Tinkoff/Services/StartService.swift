//
//  StartService.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

final class StartService {
    var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
        configureWindow()
    }
    
    func configureWindow() {
        let presenter: SplashScreenPresenting = SplashScreenPresenter()
        if let win = window {
            win.rootViewController = UINavigationController(
                rootViewController: SplashScreenBuilder.build(presenter: presenter))
            win.makeKeyAndVisible()
        }
    }
}
