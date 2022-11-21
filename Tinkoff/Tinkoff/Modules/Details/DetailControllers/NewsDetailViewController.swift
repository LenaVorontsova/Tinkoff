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
    private var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = R.color.tinkoffLightGray()
        table.separatorStyle = .none
        return table
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
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(NewsDetailTableViewCell.self,
                                forCellReuseIdentifier: "NewsDetailTableViewCell")
        configureConstraints()
        view.backgroundColor = R.color.tinkoffLightGray()
    }
    
    private func configureConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(ConstantsCell.topAndLeadImage)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-ConstantsCell.topAndLeadImage)
        }
    }
}

extension NewsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsDetailTableViewCell.identifier,
                                                       for: indexPath) as? NewsDetailTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = NewsDetailTableViewCellFactory.cellModel(detailText: viewModel.textLabel!,
                                                                 newsImage: viewModel.image!,
                                                                 newsTitle: viewModel.titleLabel!)
        cell.config(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
