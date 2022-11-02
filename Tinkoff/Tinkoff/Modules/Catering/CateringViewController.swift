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
    }
    
    private func configureConstraints() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.trailing.leading.equalToSuperview()
        }
    }
}
