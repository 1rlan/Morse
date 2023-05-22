//
//  SymbolsCardsUD.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import Foundation

struct CustomUD {
    private static let defaults = UserDefaults.standard
    private static let initialValues = InitialValues()
    
    public static func setValue<T>(data: T, keyState: UDKeys) throws where T: Codable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(data)
            defaults.set(data, forKey: keyState.key)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    public static func fetchData<T>(keyState: UDKeys, castTo type: T.Type) throws -> T where T: Codable {
        guard let data = UserDefaults.standard.data(forKey: keyState.key) else {
            throw ObjectSavableError.noValue
        }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
    
    public static func register() {
        do {
            try registerData(data: initialValues.symbolModels, keyState: .symbolCards)
            try registerData(data: initialValues.inputModel, keyState: .inputModel)
            defaults.register(defaults:
                    [
                        UDKeys.difficultyCards.key: "easy",
                        UDKeys.screenLight.key: false
                    ]
                )
        } catch {
            print("Cant register data")
        }
    }
    
    public static func resetTrainingProgress() {
        do {
            try setValue(data: initialValues.symbolModels, keyState: .symbolCards)
            try setValue(data: initialValues.inputModel, keyState: .inputModel)
        } catch {
            print("Cant register data")
        }
    }
    
    
    private static func registerData<T>(data: T, keyState: UDKeys) throws where T: Codable {
        let encoder = JSONEncoder()
        do {
            let encoded = try encoder.encode(data)
            defaults.register(defaults: [keyState.key: encoded])
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
}
