//
//  CateringPresenter.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit
import MapKit

protocol CateringPresenting {
    var mapPoints: [Map] { get set }
    func checkLocationServices()
    func checkLocationAuthorization()
    func showAlert(error: String)
    func loadData()
    func getInfoMapPoints()
    func pathPoint(mapPoint: Map) -> DetailViewModelProtocol
}

final class CateringPresenter: CateringPresenting {
    var mapPoints: [Map] = []
    weak var controller: CateringViewController?
    private let locationManager = CLLocationManager()
    let dataService: IDataService
    
    init(dataService: IDataService) {
        self.dataService = dataService
    }
    
    func loadData() {
        dataService.loadData()
        self.mapPoints = self.dataService.mapPoints
    }
    
    func getInfoMapPoints() {
        self.mapPoints = self.dataService.fetchMapPointsCoreData()
    }
    
    func checkLocationServices() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.checkLocationAuthorization()
            } else {
                self.showAlert(error: R.string.alertMessages.checkResolution())
            }
        }
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            controller?.mapView.setRegion(viewRegion, animated: true)
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            controller!.mapView.showsUserLocation = true
        case .denied:
            showAlert(error: R.string.alertMessages.denied())
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            controller!.mapView.showsUserLocation = true
        case .restricted:
            showAlert(error: R.string.alertMessages.restricted())
        case .authorizedAlways:
            break
        @unknown default:
            showAlert(error: R.string.alertMessages.somethingWrong())
        }
    }
    
    func showAlert(error: String) {
        let alert = UIAlertController(title: R.string.alertMessages.errorTitle(),
                                      message: error,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.alertMessages.okTitle(), style: .cancel))
        controller?.present(alert, animated: false)
    }
    
    func pathPoint(mapPoint: Map) -> DetailViewModelProtocol {
        return MapPointsViewModel(mapPoints: mapPoint)
    }
}
