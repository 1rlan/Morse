//
//  SymbolsCardsUD.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import Foundation

struct CustomUD {
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    
    public static func setValue<T>(data: T, keyState: UDKeys) where T: Codable {
        if let encoded = try? encoder.encode(data) {
            UserDefaults.standard.set(encoded, forKey: keyState.key)
        }
    }
    
    public static func fetchData<T>(keyState: UDKeys) -> T? where T: Codable {
        if let rawData = UserDefaults.standard.data(forKey: keyState.key) {
            if let data = try? decoder.decode(T.self, from: rawData) {
                return data
            }
        }
        
        return nil
    }
    
    public static func register() {
        registerData(data: symbolModels, keyState: .symbolCards)
    }
    
    private static func registerData<T>(data: T, keyState: UDKeys) where T: Codable {
        if let encoded = try? encoder.encode(data) {
            UserDefaults.standard.register(defaults: [keyState.key: encoded])
        }
    }
}
