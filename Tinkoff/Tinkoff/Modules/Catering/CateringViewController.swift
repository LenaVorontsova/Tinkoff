//
//  CateringViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit
import MapKit

final class CateringViewController: UIViewController, MKMapViewDelegate {
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
        mapView.delegate = self
        
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
            let mapAnnotations = MapPointsAnnotation()
            mapAnnotations.point = point
            if let lat = Double(point.lat!),
               let lng = Double(point.lng!) {
                let newLat = CLLocationDegrees(lat)
                let newLng = CLLocationDegrees(lng)
                if let mapPointType = point.mapPointType,
                   let title = point.title {
                    mapAnnotations.title = mapPointType + ": " + title
                }
                mapAnnotations.coordinate = CLLocationCoordinate2D(latitude: newLat, longitude: newLng)
                self.mapView.addAnnotation(mapAnnotations)
            }
        }
    }
    
    private func configureConstraints() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let mapAnnotations = view.annotation as? MapPointsAnnotation,
           let mapAnn = mapAnnotations.point {
            let viewModel = presenter.pathPoint(mapPoint: mapAnn)
            let controller = MapPointDetailViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }
}
