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
        let network = NetworkService()
        let dataService: IDataService = DataService(network: network)
        let presenter: SplashScreenPresenting = SplashScreenPresenter(network: network,
                                                                      dataService: dataService)
        if let win = window {
            win.rootViewController = UINavigationController(
                rootViewController: SplashScreenBuilder.build(presenter: presenter,
                                                              network: network,
                                                              dataService: dataService))
            win.makeKeyAndVisible()
        }
    }
}
