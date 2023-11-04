//
//  FavoritesCollectionViewCell.swift
//  blu
//
//  Created by Peiman on 11/1/23.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let primaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()

    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(self.imageView)
        addSubview(self.primaryLabel)
        addSubview(self.secondaryLabel)

        self.setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureCell(with model: Destination) {
        if let avatarUrl = URL(string: model.person.avatar) {
            self.imageView.kf.indicatorType = .activity
            self.imageView.kf.setImage(with: avatarUrl)
        }
        self.primaryLabel.text = model.person.fullName
        self.secondaryLabel.text = model.card.cardNumber
    }

    func setupConstraints() {
        self.snp.makeConstraints { make in
            make.width.equalTo(100)
        }

        self.imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }

        self.primaryLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.equalTo(15)
        }

        self.secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(self.primaryLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.equalTo(15)
        }
    }
}
