//
//  HomeViewController+SetupView.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import SnapKit
import UIKit

extension HomeViewController {

    func setupViews() {
        self.setupSearchBar()
        self.setupFavoriteLabel()
        self.setupFavoritesCollectionViewCell()
        self.setupDestinationTableView()
    }

    private func setupSearchBar() {
        self.view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func setupFavoriteLabel() {
        self.view.addSubview(favoriteLabel)
        favoriteLabel.snp.makeConstraints { make in
            make.top.equalTo(self.searchBar.snp.bottom).offset(8)
            make.height.equalTo(20)
            make.left.equalTo(16)
        }
    }

    private func setupFavoritesCollectionViewCell() {

        self.view.addSubview(favoritesCollectinoView)
        favoritesCollectinoView.snp.makeConstraints { make in
            make.top.equalTo(self.favoriteLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    private func setupDestinationTableView() {
        self.view.addSubview(destinationsTableView)
        destinationsTableView.snp.makeConstraints { make in
            make.top.equalTo(favoritesCollectinoView.snp.bottom)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
    }

    func updateConstraints(hideFavorites: Bool) {
        favoritesCollectinoView.snp.updateConstraints { make in
            make.height.equalTo(hideFavorites ? 0 : 100)
        }
        favoriteLabel.snp.updateConstraints { make in
            make.height.equalTo(hideFavorites ? 0 : 20)
        }
    }
}
