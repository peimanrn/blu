//
//  Person.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

struct Person: Codable, Equatable, Hashable {
    let fullName: String
    let email: String?
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email
        case avatar
    }
}
