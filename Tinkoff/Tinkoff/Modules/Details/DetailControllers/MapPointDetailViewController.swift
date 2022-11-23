//
//  MapPointDetailViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 14.11.2022.
//

import Foundation
import UIKit

final class MapPointDetailViewController: UIViewController {
    private var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = R.color.tinkoffLightGray()
        table.separatorStyle = .none
        return table
    }()
    
    let viewModel: MapPointsViewModel
    
    init(viewModel: MapPointsViewModel) {
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
        self.tableView.register(MapPointDetailTableViewCell.self,
                                forCellReuseIdentifier: "MapPointDetailTableViewCell")
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

extension MapPointDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MapPointDetailTableViewCell.identifier,
                                                       for: indexPath) as? MapPointDetailTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = MapPointDetailTableViewCellFactory.cellModel(detailText: viewModel.textLabel!,
                                                                     mapPointImage: viewModel.image!,
                                                                     mapPointTitle: viewModel.titleLabel!,
                                                                     dateOfCreation: viewModel.dateOfCreation!)
        cell.config(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
