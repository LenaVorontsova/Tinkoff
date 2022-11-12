//
//  AttractionsBuilder.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

enum AttractionsBuilder {
    static func build(dataService: IDataService) -> UIViewController {
        let presenter = AttractionsPresenter(dataService: dataService)
        let vc = AttractionsViewController(presenter: presenter)
        presenter.controller = vc
        return vc
    }
}
