//
//  UserDefaultsManager.swift
//  blu
//
//  Created by Peiman on 11/2/23.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()

    private let userDefaults = UserDefaults.standard

    func saveObject<T: Codable>(_ object: T, forKey key: String) {
        do {
            let encodedData = try JSONEncoder().encode(object)
            self.userDefaults.set(encodedData, forKey: key)
        } catch {
            print("Error saving object to UserDefaults: \(error)")
        }
    }

    func getObject<T: Codable>(forKey key: String) -> T? {
        if let encodedData = userDefaults.data(forKey: key) {
            do {
                let object = try JSONDecoder().decode(T.self, from: encodedData)
                return object
            } catch {
                print("Error retrieving object from UserDefaults: \(error)")
            }
        }
        return nil
    }

    func removeObject(forKey key: String) {
        self.userDefaults.removeObject(forKey: key)
    }
}
