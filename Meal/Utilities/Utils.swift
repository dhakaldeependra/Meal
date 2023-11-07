//
//  Utils.swift
//  Meal
//
//  Created by Deependra Dhakal on 11/4/23.
//

import Foundation

func readJSONFromFile<T: Codable>(fileName: String) -> T? {
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    return nil
}
