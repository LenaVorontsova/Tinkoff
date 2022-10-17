//
//  CateringBuilder.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

enum CateringBuilder {
    static func build() -> UIViewController {
        let presenter = CateringPresenter()
        let vc = CateringViewController(presenter: presenter)
        presenter.controller = vc
        return vc
    }
}
