//
//  AttractionDetailViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

final class AttractionDetailViewController: UIViewController {
    private lazy var attractionImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = CGFloat(ConstantsDetail.spacingStack)
        return stack
    }()
    
    let viewModel: AttractionsViewModel
    
    init(viewModel: AttractionsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        configureConstraints()
        view.backgroundColor = R.color.tinkoffGray()
    }
    
    private func addTitle() {
        guard let labels = viewModel.titleLabel else { return }
        for text in labels {
            let label = UILabel()
            label.text = text
            label.font = .systemFont(ofSize: 28)
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
        attractionImage.image = R.image.tinkoffIcon()
    }
    
    private func configureConstraints() {
        self.view.addSubview(attractionImage)
        self.view.addSubview(stackView)
        attractionImage.snp.makeConstraints {
            $0.height.width.equalTo(ConstantsDetail.sizeAvatar)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.offsetAvatar)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-ConstantsDetail.offsetAvatar)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(attractionImage.snp.bottom).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.offsetStack)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-ConstantsDetail.offsetAvatar)
        }
    }
}
