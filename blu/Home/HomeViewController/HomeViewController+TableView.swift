//
//  HomeViewController+TableView.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import UIKit

// MARK: - HomeViewController + UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DestinationTableViewCell.reuseId,
                                                       for: indexPath) as? DestinationTableViewCell
        else { return UITableViewCell() }
        let destination = self.viewModel.item(at: indexPath.row)
        cell.favoriteImage.isHidden = !self.viewModel.favoriteManager.isFavorite(destination)
        cell.configureCell(with: destination)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.items.count - 1, !viewModel.isLoading, !viewModel.hasEnded {
            self.destinationTableViewActivityIndicator.startAnimating()
            viewModel.isLoading = true
            viewModel.currentPage += 1
            viewModel.fetchData { _ in
                DispatchQueue.main.async {
                    self.destinationTableViewActivityIndicator.startAnimating()
                    self.viewModel.isLoading = false
                    self.updateConstraints(hideFavorites: self.viewModel.shouldHideFavorite)
                    self.favoritesCollectinoView.reloadData()
                    self.destinationsTableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.viewModel.item(at: indexPath.row)
        self.showDetail(model)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        let label = UILabel()
        label.text = "All"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.black

        headerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        return headerView
    }
}
