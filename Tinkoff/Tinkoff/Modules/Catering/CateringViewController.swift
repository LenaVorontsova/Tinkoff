//
//  CateringViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit
import MapKit

final class CateringViewController: UIViewController {
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    private let presenter: CateringPresenting
    private let locationManager = CLLocationManager()

    init(presenter: CateringPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraints()
        self.title = "Питание"
        presenter.checkLocationServices()
        presenter.loadData()
        createMapPoints(mapPointsArray: presenter.mapPoints)
        mapView.reloadInputViews()
    }
    
    private func createMapPoints(mapPointsArray: [Map]) {
        for point in mapPointsArray {
            let annotations = MKPointAnnotation()
            if let lat = Double(point.lat!),
               let lng = Double(point.lng!) {
                let newLat = CLLocationDegrees(lat)
                let newLng = CLLocationDegrees(lng)
                annotations.title = point.title
                annotations.coordinate = CLLocationCoordinate2D(latitude: newLat, longitude: newLng)
                self.mapView.addAnnotation(annotations)
            }
        }
    }
    
    //    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
        //      for stadium in stadiums {
        //        let annotations = MKPointAnnotation()
        //        annotations.title = stadium.name
        //        annotations.coordinate = CLLocationCoordinate2D(latitude: stadium.lattitude, longitude: stadium.longtitude)
        //        mapView.addAnnotation(annotations)
        //      }
        //    }
    
    private func configureConstraints() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
    }
}
