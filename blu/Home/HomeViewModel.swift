//
//  HomeViewModel.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

class HomeViewModel {

    let generalService = GeneralService()
    let favoriteManager = FavoritesManager.shared
    var items: [Destination] = []
    var searchItems: [Destination] = []
    var favorites: [Destination] = []
    var searchFavorites: [Destination] = []
    var currentPage = 1
    var lastPage: Int?
    var isLoading = false
    var isSearching = false

    var hasEnded: Bool {
        guard let lastPage = lastPage else { return false }
        return self.currentPage >= lastPage
    }

    var shouldHideFavorite: Bool {
        self.numberOfFavoriteItems() == 0
    }

    func numberOfItems() -> Int {
        self.isSearching ? self.searchItems.count : self.items.count
    }

    func item(at index: Int) -> Destination {
        self.isSearching ? self.searchItems[index] : self.items[index]
    }

    func updateFavorites() {
        let userDefaultFavorites = self.favoriteManager.favoriteDestinations
        let filteredFavorites = Set(items).intersection(Set(userDefaultFavorites)).map { $0 }
        self.favorites = filteredFavorites
    }

    func numberOfFavoriteItems() -> Int {
        self.isSearching ? self.searchFavorites.count : self.favorites.count
    }

    func favoriteItem(at index: Int) -> Destination {
        self.isSearching ? self.searchFavorites[index] : self.favorites[index]
    }

    func fetchData(completion: @escaping (Result<[Destination], Error>) -> Void) {
        self.generalService.fetchDestinations(for: self.currentPage) { [self] result in
            switch result {
            case let .success(destinations):
                if destinations.isEmpty {
                    self.lastPage = self.currentPage
                } else {
                    if self.currentPage > 1 {
                        self.items += destinations
                    } else {
                        self.items = destinations
                    }
                    self.updateFavorites()
                }
                completion(.success(destinations))
            case let .failure(error):
                print(error)
            }
        }
    }

    func search(_ name: String) {
        self.isSearching = true
        if name.isEmpty {
            self.searchItems = self.items
            self.searchFavorites = self.favorites
        } else {
            self.searchItems = self.items
                .filter { $0.person.fullName.lowercased().contains(name.lowercased()) }
            self.searchFavorites = self.favorites
                .filter { $0.person.fullName.lowercased().contains(name.lowercased()) }
        }
    }
}
