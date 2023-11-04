//
//  UICollectionViewCell+Extensions.swift
//  blu
//
//  Created by Peiman on 11/4/23.
//

import UIKit

extension UICollectionViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
