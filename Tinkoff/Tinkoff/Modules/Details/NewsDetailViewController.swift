//
//  NewsDetailViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

enum ConstantsDetail {
    static let sizeAvatar = 250
    static let topAvatar = 10
    static let offsetAvatar = 20
    static let leadStack = 30
    static let topStack = 370
    static let spacingStack = 5
}

final class NewsDetailViewController: UIViewController {
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = CGFloat(ConstantsDetail.spacingStack)
        return stack
    }()
    
    let viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitle()
        configureConstraints()
        view.backgroundColor = UIColor(named: "tinkoffGray")
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
    }
    
    private func configureConstraints() {
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ConstantsDetail.topStack)
            $0.center.equalToSuperview()
        }
    }
}
