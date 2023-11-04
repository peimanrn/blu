//
//  DestinationTableViewCell.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Kingfisher
import UIKit

class DestinationTableViewCell: UITableViewCell {

    private lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var primaryTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var secondaryTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()

    let favoriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.isHidden = true
        return imageView
    }()

    private lazy var rightArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.gray
        return imageView
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }

    override func prepareForReuse() {
        self.personImageView.image = nil
    }

    func configureCell(with model: Destination) {
        if let avatarUrl = URL(string: model.person.avatar) {
            self.personImageView.kf.indicatorType = .activity
            self.personImageView.kf.setImage(with: avatarUrl)
        }
        self.primaryTextLabel.text = model.person.fullName
        self.secondaryTextLabel.text = model.card.cardNumber
    }

    private func setupViews() {
        self.setupCircularImageView()
        self.setupPrimaryTextLabel()
        self.setupSecondaryTextLabel()
        self.setupRightArrowImageView()
        self.setupFavoriteImage()
    }

    private func setupCircularImageView() {
        contentView.addSubview(self.personImageView)
        self.personImageView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.leading.equalTo(contentView.snp.leadingMargin).offset(10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(50)
        }
    }

    private func setupPrimaryTextLabel() {
        contentView.addSubview(self.primaryTextLabel)
        self.primaryTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.personImageView.snp.trailing).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
    }

    private func setupSecondaryTextLabel() {
        contentView.addSubview(self.secondaryTextLabel)
        self.secondaryTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.primaryTextLabel.snp.leading)
            make.top.equalTo(self.primaryTextLabel.snp.bottom).offset(4)
        }
    }

    private func setupRightArrowImageView() {
        contentView.addSubview(self.rightArrowImageView)
        self.rightArrowImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailingMargin)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }

    private func setupFavoriteImage() {
        contentView.addSubview(self.favoriteImage)
        self.favoriteImage.snp.makeConstraints { make in
            make.trailing.equalTo(self.rightArrowImageView.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }
}
