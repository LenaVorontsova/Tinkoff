//
//  AttractionDetailViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 20.10.2022.
//

import Foundation
import UIKit

final class AttractionDetailViewController: UIViewController {
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
        self.tableView.register(AttractionsDetailTableViewCell.self,
                                forCellReuseIdentifier: "AttractionsDetailTableViewCell")
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

extension AttractionDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AttractionsDetailTableViewCell.identifier,
                                                       for: indexPath) as? AttractionsDetailTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = AttractionsDetailTableViewCellFactory.cellModel(detailText: viewModel.textLabel!,
                                                                        attrImage: viewModel.image!,
                                                                        attrTitle: viewModel.titleLabel!)
        cell.config(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
