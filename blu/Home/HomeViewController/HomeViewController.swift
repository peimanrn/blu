//
//  HomeViewController.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()

    private(set) lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.delegate = self
        view.placeholder = "Search destinations by name"
        return view
    }()

    private(set) lazy var favoriteLabel: UILabel = {
        let view = UILabel()
        view.text = "Favorite"
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.textColor = UIColor.black
        return view
    }()

    private(set) lazy var favoritesCollectinoView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .init(width: 50, height: 100)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(FavoritesCollectionViewCell.self,
                      forCellWithReuseIdentifier: FavoritesCollectionViewCell.reuseId)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        return view
    }()

    private(set) lazy var destinationsTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(DestinationTableViewCell.self, forCellReuseIdentifier: DestinationTableViewCell.reuseId)
        view.refreshControl = self.refreshControl
        view.tableFooterView = destinationTableViewActivityIndicator
        return view
    }()

    private(set) lazy var destinationTableViewActivityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = .black
        view.hidesWhenStopped = true
        return view
    }()

    private(set) lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        return view
    }()

    private(set) lazy var activityIndicator = BLActivityIndicator(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSelfView()
        self.setupViews()
        self.fetchData()
        self.updateConstraints(hideFavorites: self.viewModel.shouldHideFavorite)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.updateFavorites()
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.updateView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func showActivityIndicator() {
        self.activityIndicator.show(in: self.view)
    }

    func stopActivityIndicator() {
        self.activityIndicator.stop()
    }

    private func setupSelfView() {
        self.view.backgroundColor = .white
    }

    func showDetail(_ model: Destination) {
        let viewModel = DetailViewModel(model: model)
        let viewController = DetailViewController(viewModel: viewModel)
        self.navigationController?.show(viewController, sender: nil)
    }

    func updateView() {
        self.favoritesCollectinoView.reloadData()
        self.destinationsTableView.reloadData()
        self.updateConstraints(hideFavorites: self.viewModel.shouldHideFavorite)
    }

    private func fetchData() {
        self.showActivityIndicator()
        self.viewModel.fetchData { _ in
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.updateView()
            }
        }
    }

    @objc func refreshData() {
        self.viewModel.currentPage = 1
        self.viewModel.fetchData { _ in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.updateView()
            }
        }
    }
}
