//
//  AttractionsViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import Foundation
import UIKit

final class AttractionsViewController: UIViewController {
    private var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        return table
    }()
    private let presenter: AttractionsPresenting
    private lazy var refreshControl = UIRefreshControl()

    init(presenter: AttractionsPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError(R.string.cells.fatalError())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        configureConstraints()
        presenter.loadData()
        self.tableView.register(AttractionsTableViewCell.self,
                                forCellReuseIdentifier: AttractionsTableViewCell.identifier)
        view.backgroundColor = .white
        self.title = R.string.modules.attractionTitleRus()
        configureRefresh()
        self.reloadTable()
    }
    
    private func configureRefresh() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc
    func refreshData() {
        presenter.loadData()
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
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
    
    func reloadTable() {
        self.tableView.reloadData()
    }
}

extension AttractionsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.attractionsSearch.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AttractionsTableViewCell.identifier,
                                                       for: indexPath) as? AttractionsTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = AttractionTableViewCellFactory.cellModel(presenter.attractionsSearch[indexPath.section])
        cell.config(with: cellModel)
        if let url = URL(string: presenter.attractionsSearch[indexPath.section].image!),
           let data = try? Data(contentsOf: url) {
            cell.attractionImage.image = UIImage(data: data)
        } else {
            cell.attractionImage.image = R.image.tinkoffIcon()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = presenter.pathAttraction(indexPath: indexPath)
        let controller = AttractionDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
