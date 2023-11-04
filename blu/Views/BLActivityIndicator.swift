//
//  BLActivityIndicator.swift
//  blu
//
//  Created by Peiman on 11/1/23.
//

import UIKit

class BLActivityIndicator: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        self.setupView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }

    private func setupView() {
        color = .gray
        hidesWhenStopped = true
    }

    func show(in view: UIView) {
        frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        center = view.center
        view.addSubview(self)
        startAnimating()
    }

    func stop() {
        stopAnimating()
        removeFromSuperview()
    }
}
