//
//  NetworkManager.swift
//  blu
//
//  Created by Peiman on 10/31/23.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private let baseURL = "https://c8d7cf9d-f565-4b84-aeb6-5e31f60eed42.mock.pstmn.io"

    private init() { }

    func fetchData<T: Codable>(endpoint: String, responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(responseType, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
