//
//  AttractionsPresenter.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

protocol AttractionsPresenting: AnyObject {
    var attractions: [Attraction] { get set }
    var attractionsSearch: [Attraction] { get set }
    func fillInAttractions()
}

final class AttractionsPresenter: AttractionsPresenting {
    var attractions: [Attraction] = []
    var attractionsSearch: [Attraction] = []
    weak var controller: AttractionsViewController?
    
    func fillInAttractions() {
        for _ in 0...10 {
            attractions.append(Attraction(image: UIImage(named: "person.3"),
                                          attractionTitle: "AttractionsName",
                                          attractionAddress: "AttractionsAddres"))
            attractionsSearch = attractions
        }
        self.controller?.reloadTable()
    }
}
