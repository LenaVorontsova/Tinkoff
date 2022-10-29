//
//  NewsTableViewCell.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit
import SnapKit
import Rswift

struct NewsTableViewCellModel {
    let newsTitle: String?
    let newsTextTitle: String?
}

enum NewsTableViewCellFactory {
    static func cellModel(_ inf: News) -> NewsTableViewCellModel {
        NewsTableViewCellModel(newsTitle: inf.newsTitle,
                               newsTextTitle: inf.newsText)
    }
}

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

enum ConstantsCell {
    static let sizeImage = 103
    static let topAndLeadImage = 10
    
    static let offsetLabels = 20
    static let topLabels = 5
}

final class NewsTableViewCell: UITableViewCell {
    lazy var newsImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        return label
    }()
    
    private lazy var newsTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = R.color.tinkoffGray()
        contentView.layer.cornerRadius = 15
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    private func configureConstraints() {
        contentView.addSubview(newsImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(newsTextLabel)
        newsImage.snp.makeConstraints {
            $0.width.height.equalTo(ConstantsCell.sizeImage)
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(ConstantsCell.topAndLeadImage)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading)
                .offset(ConstantsCell.topAndLeadImage)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ConstantsCell.topAndLeadImage)
            $0.leading.equalTo(newsImage.snp.trailing).offset(ConstantsCell.offsetLabels)
            $0.trailing.equalToSuperview().offset(-ConstantsCell.offsetLabels)
        }
        newsTextLabel.snp.makeConstraints {
            $0.leading.equalTo(newsImage.snp.trailing).offset(ConstantsCell.offsetLabels)
            $0.trailing.equalToSuperview().offset(-ConstantsCell.offsetLabels)
            $0.top.equalTo(titleLabel.snp.bottom).offset(ConstantsCell.topLabels)
        }
    }
    
    func config(with model: NewsTableViewCellModel) {
        titleLabel.text = model.newsTitle
        newsTextLabel.text = model.newsTextTitle
    }
}

extension NewsTableViewCell: ReusableView {
    static var identifier: String {
        return R.string.cells.newsCell()
    }
}
