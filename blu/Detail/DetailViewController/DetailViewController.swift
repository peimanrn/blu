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

    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private(set) lazy var primaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()

    private(set) lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    private(set) lazy var cardTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    private(set) lazy var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Note:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()

    private(set) lazy var noteTextView: UITextView = {
        let textView = UITextView()
        textView.text = "This is a sample description."
        textView.textColor = .black
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.borderWidth = 2
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        textView.isEditable = false
        return textView
    }()

    private(set) lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.4
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.imageView?.tintColor = .systemYellow
        button.imageView?.contentMode = .scaleAspectFit
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        button.addTarget(self, action: #selector(self.didTapFavoriteButton), for: .touchUpInside)
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
        self.cardTypeLabel.text = "Card type: \(self.viewModel.model.card.cardType)"
        if let note = self.viewModel.model.note {
            self.noteTextView.text = self.viewModel.model.note
        } else {
            self.noteLabel.isHidden = true
            self.noteTextView.isHidden = true
        }
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
