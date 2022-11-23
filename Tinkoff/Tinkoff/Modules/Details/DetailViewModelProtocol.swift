//
//  DetailViewModelProtocol.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol {
    var image: String? { get }
    var titleLabel: String? { get }
    var textLabel: String? { get }
    var dateOfCreation: String? { get }
}
