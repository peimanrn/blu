//
//  Destination.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

struct Destination: Codable, Equatable, Hashable {

    let person: Person
    let card: Card
    let lastTransfer: String
    let note: String?
    let moreInfo: MoreInfo

    enum CodingKeys: String, CodingKey {
        case person
        case card
        case lastTransfer = "last_transfer"
        case note
        case moreInfo = "more_info"
    }
}
