//
//  Card.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

struct Card: Codable, Equatable, Hashable {
    let cardNumber: String
    let cardType: String

    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case cardType = "card_type"
    }
}
