//
//  CateringViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit
import MapKit

enum ConstantsMap {
    static let sizeButton = 50
    static let offsetButton = 30
    static let widthTF = 100
    static let offsetTF = 20
    static let topTF = 30
    static let bottomTF = 100
}

final class CateringViewController: UIViewController, MKMapViewDelegate {
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    lazy var addPointButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        return button
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
        addPointButton.addTarget(self, action: #selector(addPoint), for: .touchUpInside)
        
        view.backgroundColor = .white
        configureConstraints()
        self.title = "Питание"
        presenter.checkLocationServices()
        presenter.loadData()
        createMapPoints(mapPointsArray: presenter.mapPoints)
        mapView.reloadInputViews()
    }
    
    @objc
    func addPoint() {
        presenter.addNewPoint()
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
        mapView.addSubview(addPointButton)
        mapView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
        addPointButton.snp.makeConstraints {
            $0.height.width.equalTo(ConstantsMap.sizeButton)
            $0.trailing.equalTo(mapView.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsMap.offsetButton)
            $0.bottom.equalTo(mapView.safeAreaLayoutGuide.snp.bottom).offset(-ConstantsMap.offsetButton)
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
