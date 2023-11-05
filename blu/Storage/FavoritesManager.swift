//
//  FavoritesManager.swift
//  blu
//
//  Created by Peiman on 11/2/23.
//

import Foundation

class FavoritesManager {
    static let shared = FavoritesManager()

    @UserDefaultsWrapper(key: "favoriteDestinationsKey", defaultValue: [Destination]())
    var favoriteDestinations: [Destination]

    func isFavorite(_ destination: Destination) -> Bool {
        self.favoriteDestinations.contains(destination)
    }

    func add(_ destination: Destination) {
        if !self.isFavorite(destination) {
            self.favoriteDestinations.append(destination)
        }
    }

    func remove(_ destination: Destination) {
        self.favoriteDestinations.removeAll { $0 == destination }
    }

    func removeAll() {
        self.favoriteDestinations = []
    }
}
