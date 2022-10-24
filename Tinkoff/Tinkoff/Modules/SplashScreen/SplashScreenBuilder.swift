//
//  SplashScreenBuilder.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

enum SplashScreenBuilder {
    static func build(presenter: SplashScreenPresenting,
                      network: NetworkService,
                      dataService: IDataService) -> UIViewController {
        let presenter: SplashScreenPresenting = SplashScreenPresenter(network: network,
                                                                      dataService: dataService)
        let vc = SplashScreenViewController(presenter: presenter)
        presenter.controller = vc
        return vc
    }
}
