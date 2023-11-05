//
//  DetailViewController+SetupViews.swift
//  blu
//
//  Created by Peiman on 11/3/23.
//

import UIKit

extension DetailViewController {
    func setupViews() {
        self.setupSelfView()
        self.setupImageView()
        self.setupPrimaryLabel()
        self.setupSecondaryLabel()
        self.setupCardTypeLabel()
        self.setupNoteLabel()
        self.setupNoteTextArea()
        self.setupFavoriteButton()
    }

    private func setupSelfView() {
        self.view.backgroundColor = .white
    }

    private func setupImageView() {
        view.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.height.equalTo(100)
        }
    }

    private func setupPrimaryLabel() {
        view.addSubview(self.primaryLabel)
        self.primaryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
        }
    }

    private func setupSecondaryLabel() {
        view.addSubview(self.secondaryLabel)
        self.secondaryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.primaryLabel.snp.bottom).offset(5)
        }
    }

    private func setupCardTypeLabel() {
        view.addSubview(self.cardTypeLabel)
        self.cardTypeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.secondaryLabel.snp.bottom).offset(5)
        }
    }

    private func setupNoteLabel() {
        view.addSubview(noteLabel)
        self.noteLabel.snp.makeConstraints { make in
            make.top.equalTo(self.cardTypeLabel.snp.bottom).offset(20)
            make.leading.equalTo(20)
        }
    }

    private func setupNoteTextArea() {
        view.addSubview(self.noteTextView)
        self.noteTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.noteLabel.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.height.equalTo(150)
        }
    }


    private func setupFavoriteButton() {
        view.addSubview(self.favoriteButton)
        self.favoriteButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.leading.equalTo(60)
            make.height.equalTo(50)
        }
    }
}
