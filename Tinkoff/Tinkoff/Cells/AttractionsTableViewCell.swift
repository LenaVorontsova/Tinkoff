//
//  AttractionsTableViewCell.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit
import SnapKit

struct AttractionTableViewCellModel {
    let attractionTitle: String?
    let attractionAddress: String?
}

enum AttractionTableViewCellFactory {
    static func cellModel(_ inf: Attraction) -> AttractionTableViewCellModel {
        AttractionTableViewCellModel(attractionTitle: inf.attractionTitle,
                                     attractionAddress: inf.attractionAddress)
    }
}

final class AttractionsTableViewCell: UITableViewCell {
    lazy var attractionImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var attractionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        return label
    }()
    
    private lazy var attractionAddressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = R.color.tinkoffLightGray()
        contentView.layer.cornerRadius = 15
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    private func configureConstraints() {
        contentView.addSubview(attractionImage)
        contentView.addSubview(attractionTitleLabel)
        contentView.addSubview(attractionAddressLabel)
        attractionImage.snp.makeConstraints {
            $0.width.height.equalTo(ConstantsCell.sizeImage)
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(ConstantsCell.topAndLeadImage)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading)
                .offset(ConstantsCell.topAndLeadImage)
        }
        attractionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(ConstantsCell.topAndLeadImage)
            $0.leading.equalTo(attractionImage.snp.trailing).offset(ConstantsCell.offsetLabels)
            $0.trailing.equalToSuperview().offset(-ConstantsCell.offsetLabels)
        }
        attractionAddressLabel.snp.makeConstraints {
            $0.leading.equalTo(attractionImage.snp.trailing).offset(ConstantsCell.offsetLabels)
            $0.trailing.equalToSuperview().offset(-ConstantsCell.offsetLabels)
            $0.top.equalTo(attractionTitleLabel.snp.bottom).offset(ConstantsCell.topLabels)
        }
    }
    
    func config(with model: AttractionTableViewCellModel) {
        attractionTitleLabel.text = model.attractionTitle
        attractionAddressLabel.text = model.attractionAddress
    }
}

extension AttractionsTableViewCell: ReusableView {
    static var identifier: String {
        return R.string.cells.attractionsCell()
    }
}
