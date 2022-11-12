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
    func pathAttraction(indexPath: IndexPath) -> AttractionsViewModel
    func loadData()
}

final class AttractionsPresenter: AttractionsPresenting {
    var attractions: [Attraction] = []
    var attractionsSearch: [Attraction] = []
    weak var controller: AttractionsViewController?
    
    let dataService: IDataService
    
    init(dataService: IDataService) {
        self.dataService = dataService
    }
    
    func loadData() {
        dataService.loadData()
        self.attractions = self.dataService.attractions
        self.attractionsSearch = self.attractions
        self.controller?.reloadTable()
    }
    
    func pathAttraction(indexPath: IndexPath) -> AttractionsViewModel {
        return AttractionsViewModel(attraction: attractionsSearch[indexPath.section])
    }
}
