//
//  DetailViewController.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import SnapKit
import UIKit

class DetailViewController: UIViewController {
    let viewModel: DetailViewModel

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let primaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()

    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.imageView?.tintColor = .systemYellow
        button.imageView?.contentMode = .scaleAspectFit
        button.configuration?.imagePadding = 10
        button.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        return button
    }()

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.fillData()
    }

    func fillData() {
        if let avatarUrl = URL(string: self.viewModel.model.person.avatar) {
            self.imageView.kf.indicatorType = .activity
            self.imageView.kf.setImage(with: avatarUrl)
        }
        self.primaryLabel.text = self.viewModel.model.person.fullName
        self.secondaryLabel.text = self.viewModel.model.card.cardNumber
        if self.viewModel.isFavorite() {
            self.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            self.favoriteButton.setTitle("Unfavorite", for: .normal)
        } else {
            self.favoriteButton.setTitle("Favorite", for: .normal)
            self.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapFavoriteButton() {
        if self.viewModel.isFavorite() {
            self.viewModel.removeFromFavorite()
            self.favoriteButton.setTitle("Favorite", for: .normal)
            self.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)

        } else {
            self.viewModel.addToFavorite()
            self.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            self.favoriteButton.setTitle("Unfavorite", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
}
