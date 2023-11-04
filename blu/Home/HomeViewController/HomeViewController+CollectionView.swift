//
//  HomeViewController+CollectionView.swift
//  blu
//
//  Created by Peiman on 11/1/23.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.numberOfFavoriteItems()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.reuseId,
                                 for: indexPath) as? FavoritesCollectionViewCell
        else { return UICollectionViewCell() }
        let destination = self.viewModel.favoriteItem(at: indexPath.row)
        cell.configureCell(with: destination)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 40.0)
    }
}
