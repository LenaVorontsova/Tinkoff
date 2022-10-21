//
//  SplashScreenViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

enum SplashConstant {
    static let topImage = 100
    static let offsetImage = 10
}

final class SplashScreenViewController: UIViewController {
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.image = R.image.tinkoffIcon()
        return image
    }()
    private let presenter: SplashScreenPresenting

    init(presenter: SplashScreenPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        presenter.getInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func configureConstraints() {
        view.backgroundColor = R.color.tinkoffYellow()
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(SplashConstant.topImage)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(SplashConstant.offsetImage)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-SplashConstant.offsetImage)
        }
    }
}
