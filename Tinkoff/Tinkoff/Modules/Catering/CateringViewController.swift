//
//  CateringViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

final class CateringViewController: UIViewController {
    private let presenter: CateringPresenting

    init(presenter: CateringPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.tinkoffGray()
        presenter.showMap()
    }
}
