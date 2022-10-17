//
//  NewsBuilder.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

enum NewsBuilder {
    static func build() -> UIViewController {
        let presenter = NewsPresenter()
        let vc = NewsViewController(presenter: presenter)
        presenter.controller = vc
        return vc
    }
}
