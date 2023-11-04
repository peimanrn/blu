//
//  GeneralService.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

class GeneralService {

    private let networkManager = NetworkManager.shared

    func fetchDestinations(for page: Int, completion: @escaping (Result<[Destination], Error>) -> Void) {
        let endpoint = "/transfer-list/?page=\(page)"
        self.networkManager.fetchData(endpoint: endpoint, responseType: [Destination].self,
                                      completion: completion)
    }
}
