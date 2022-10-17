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
        return table
    }()
    private var searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
    }()
    private let presenter: AttractionsPresenting

    init(presenter: AttractionsPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        configureConstraints()
        presenter.fillInAttractions()
        self.tableView.register(AttractionsTableViewCell.self,
                                forCellReuseIdentifier: AttractionsTableViewCell.identifier)
        self.title = "Достопримечательности"
        view.backgroundColor = UIColor(named: "tinkoffGray")
    }
    
    private func configureConstraints() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.leading.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.trailing.leading.equalToSuperview()
        }
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
}

extension AttractionsViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AttractionsTableViewCell.identifier,
                                                       for: indexPath) as? AttractionsTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = AttractionTableViewCellFactory.cellModel(presenter.attractionsSearch[indexPath.row])
        cell.config(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let viewModel = presenter.pathCharacterViewModel(indexPath: indexPath)
//        let controller = DetailViewController(viewModel: viewModel)
//        self.navigationController?.pushViewController(controller, animated: true)
//        let alert = self.presenter.showNotification()
//        self.present(alert, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        presenter.searchCharacter(searchText: searchText)
    }
}
