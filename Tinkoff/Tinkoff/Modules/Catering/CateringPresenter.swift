//
//  CateringPresenter.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

protocol CateringPresenting {
    func showMap()
}

final class CateringPresenter: CateringPresenting {
    weak var controller: CateringViewController?
    
    func showMap() {
    }
}
