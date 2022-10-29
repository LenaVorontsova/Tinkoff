//
//  NewsViewController.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 17.10.2022.
//

import UIKit
import SnapKit

class NewsViewController: UIViewController {
    private var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    private var searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
    }()
    private let presenter: NewsPresenting
    
    init(presenter: NewsPresenting) {
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
        searchBar.delegate = self
        configureConstraints()
        presenter.loadData()
        presenter.getInfoNews()
        self.tableView.register(NewsTableViewCell.self,
                                forCellReuseIdentifier: NewsTableViewCell.identifier)
        view.backgroundColor = R.color.tinkoffLightGray()
        self.title = R.string.modules.newsTitleRus()
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

extension NewsViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.newsSearch.count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 10)) as UIView
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier,
                                                       for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let cellModel = NewsTableViewCellFactory.cellModel(presenter.newsSearch[indexPath.row])
        cell.config(with: cellModel)
        cell.newsImage.image = presenter.newsSearch[indexPath.row].photoPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = presenter.pathNews(indexPath: indexPath)
        let controller = NewsDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        presenter.searchCharacter(searchText: searchText)
    }
}
