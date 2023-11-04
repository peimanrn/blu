//
//  DetailViewModel.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

class DetailViewModel {
    let model: Destination
    private let favoriteManager = FavoritesManager.shared

    init(model: Destination) {
        self.model = model
    }

    func isFavorite() -> Bool {
        self.favoriteManager.isFavorite(self.model)
    }

    func addToFavorite() {
        self.favoriteManager.add(self.model)
    }

    func removeFromFavorite() {
        self.favoriteManager.remove(self.model)
        print("removed \(self.model)")
    }
}
