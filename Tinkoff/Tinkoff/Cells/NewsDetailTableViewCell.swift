//
//  NewsDetailTableViewCell.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 21.11.2022.
//

import Foundation
import UIKit
import SnapKit
import Rswift

struct NewsDetailTableViewCellModel {
    let detailText: String?
    let newsImage: String?
    let newsTitle: String?
    let dateOfCreation: String?
}

enum NewsDetailTableViewCellFactory {
    static func cellModel(detailText: String,
                          newsImage: String,
                          newsTitle: String,
                          dateOfCreation: String) -> NewsDetailTableViewCellModel {
        NewsDetailTableViewCellModel(detailText: detailText,
                                     newsImage: newsImage,
                                     newsTitle: newsTitle,
                                     dateOfCreation: dateOfCreation)
    }
}

final class NewsDetailTableViewCell: UITableViewCell {
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.backgroundColor = R.color.tinkoffLightGray()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private lazy var dateOfCreation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.backgroundColor = R.color.tinkoffLightGray()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = R.color.tinkoffLightGray()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    private func configureConstraints() {
        contentView.addSubview(newsImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailText)
        contentView.addSubview(dateOfCreation)
        newsImage.snp.makeConstraints {
            $0.height.width.equalTo(ConstantsDetail.sizeAvatar)
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(ConstantsDetail.offsetAvatar)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsDetail.offsetAvatar)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(newsImage.snp.bottom).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(ConstantsDetail.offsetStack)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsDetail.offsetStack)
        }
        detailText.snp.makeConstraints { 
            $0.top.equalTo(titleLabel.safeAreaLayoutGuide.snp.bottom).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(ConstantsDetail.offsetStack)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsDetail.offsetStack)
        }
        dateOfCreation.snp.makeConstraints {
            $0.top.equalTo(detailText.safeAreaLayoutGuide.snp.bottom).offset(ConstantsDetail.topAndBottom)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(ConstantsDetail.offsetStack)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsDetail.offsetStack)
            $0.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom).offset(-ConstantsDetail.topAndBottom)
        }
    }
    
    func config(with model: NewsDetailTableViewCellModel) {
        detailText.text = model.detailText
        if let url = URL(string: model.newsImage!),
           let data = try? Data(contentsOf: url) {
            newsImage.image = UIImage(data: data)
        } else {
            newsImage.image = R.image.tinkoffIcon()
        }
        titleLabel.text = model.newsTitle
        var dateText = (model.dateOfCreation?.replacingOccurrences(of: "T", with: " "))!
        var arr = dateText.components(separatedBy: ":")
        arr.removeLast()
        dateText = arr.joined(separator: ":")
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd hh:mm"
        if let date = dateFormater.date(from: dateText) {
            dateFormater.dateFormat = "dd.MM.yyyy hh:mm"
            let newDate = dateFormater.string(from: date)
            dateOfCreation.text = newDate
        } else {
            dateOfCreation.text = ""
        }
    }
}

extension NewsDetailTableViewCell: ReusableView {
    static var identifier: String {
        return "NewsDetailTableViewCell"
    }
}
