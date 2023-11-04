//
//  HomeViewController+SearchBar.swift
//  blu
//
//  Created by Peiman on 11/3/23.
//

import UIKit

extension HomeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        self.viewModel.isSearching = false
        self.updateView()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(searchText)
        self.updateView()
    }
}
