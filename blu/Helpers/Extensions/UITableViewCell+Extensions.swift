//
//  UITableViewCell+Extensions.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import UIKit

extension UITableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
