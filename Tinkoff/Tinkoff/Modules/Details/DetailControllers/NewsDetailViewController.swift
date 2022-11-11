//
//  NewsDetailViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

enum ConstantsDetail {
    static let sizeAvatar = 200
    static let topAndBottom = 10
    static let offsetAvatar = 20
    static let offsetStack = 15
    static let spacingStack = 5
}

final class NewsDetailViewController: UIViewController {
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .justified
        label.numberOfLines = 5
        return label
    }()
    
    private lazy var textLabel: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.autocapitalizationType = .words
        textView.textAlignment = .left
        textView.backgroundColor = R.color.tinkoffLightGray()
        return textView
    }()
    
    let viewModel: DetailViewModelProtocol
    
    init(viewModel: DetailViewModelProtocol) {
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
        view.backgroundColor = R.color.tinkoffLightGray()
    }
    
    private func addTitle() {
        if let url = URL(string: viewModel.image!),
           let data = try? Data(contentsOf: url) {
            newsImage.image = UIImage(data: data)
        } else {
            newsImage.image = R.image.tinkoffIcon()
        }
        titleLabel.text = viewModel.titleLabel
        textLabel.text = viewModel.textLabel
    }
    
    private func configureConstraints() {
        self.view.addSubview(newsImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(textLabel)
        newsImage.snp.makeConstraints {
            $0.height.width.equalTo(ConstantsDetail.sizeAvatar)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.offsetAvatar)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-ConstantsDetail.offsetAvatar)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(newsImage.snp.bottom).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.offsetStack)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-ConstantsDetail.offsetAvatar)
        }
        textLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(ConstantsDetail.spacingStack)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(ConstantsDetail.offsetStack)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-ConstantsDetail.offsetAvatar)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-ConstantsDetail.topAndBottom)
        }
    }
}
