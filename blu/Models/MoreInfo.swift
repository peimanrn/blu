//
//  MoreInfo.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

struct MoreInfo: Codable, Equatable, Hashable {
    let numberOfTransfers: Int
    let totalTransfer: Int

    enum CodingKeys: String, CodingKey {
        case numberOfTransfers = "number_of_transfers"
        case totalTransfer = "total_transfer"
    }
}
