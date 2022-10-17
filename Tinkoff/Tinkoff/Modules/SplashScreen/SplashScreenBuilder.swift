//
//  SplashScreenBuilder.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

enum SplashScreenBuilder {
    static func build(presenter: SplashScreenPresenting) -> UIViewController {
        let presenter: SplashScreenPresenting = SplashScreenPresenter()
        let vc = SplashScreenViewController(presenter: presenter)
        presenter.controller = vc
        return vc
    }
}
