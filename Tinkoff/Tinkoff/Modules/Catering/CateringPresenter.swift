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
    func checkLocationServices()
    func checkLocationAuthorization()
    func showAlert(error: String)
}

final class CateringPresenter: CateringPresenting {
    weak var controller: CateringViewController?
    private let locationManager = CLLocationManager()
    
    func checkLocationServices() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.checkLocationAuthorization()
            } else {
                self.showAlert(error: R.string.alertMessages.checkResolution())
            }
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
}
