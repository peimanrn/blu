//
//  FavoritesManager.swift
//  blu
//
//  Created by Peiman on 11/2/23.
//

import Foundation
class FavoritesManager {
    static let shared = FavoritesManager()

    private let userDefaultsManager = UserDefaultsManager()
    private let key = "favoriteDestinationsKey"

    private func persist(_ destinations: [Destination]) {
        self.userDefaultsManager.saveObject(destinations, forKey: self.key)
    }

    func getAll() -> [Destination] {
        if let savedDestinations: [Destination] = userDefaultsManager
            .getObject(forKey: key) {
            return savedDestinations
        }
        return []
    }

    func isFavorite(_ destination: Destination) -> Bool {
        let destinations = self.getAll()
        return destinations.contains(destination)
    }

    func add(_ destination: Destination) {
        var destinations = self.getAll()
        if !self.isFavorite(destination) {
            destinations.append(destination)
        }
        self.persist(destinations)
    }

    func remove(_ destination: Destination) {
        var destinations = self.getAll()
        destinations.removeAll { $0 == destination }
        self.persist(destinations)
    }

    func removeAll() {
        self.userDefaultsManager.removeObject(forKey: self.key)
    }
}
