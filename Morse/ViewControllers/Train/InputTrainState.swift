//
//  InputTrainState.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import Foundation

final class InputTrainState: ObservableObject {
    @Published var stringToShow: String?
    private var models: InputModel
    private var difficultyLevel: DifficultyState
    
    init() {
        do {
            models = try CustomUD.fetchData(keyState: .inputModel, castTo: InputModel.self)
            difficultyLevel = DifficultyState(raw: UserDefaults.standard.string(forKey: UDKeys.difficultyCards.key) ?? "easy") ?? .easy
            setNewValue()
        } catch {
            fatalError("Cant fetch cardModels")
        }
    }

    func setNewValue() {
        switch difficultyLevel {
        case .easy:
            stringToShow = models.characters.randomElement()
        case .medium:
            stringToShow = models.words.randomElement()
        case .hard:
            stringToShow = models.sentences.randomElement()
        }
    }
    
    func saveData() {
        do {
            try CustomUD.setValue(data: models, keyState: .inputModel)
        } catch {
            print("Cant save data for inputModel")
        }
    }
    
    public func deleteValue() {
        switch difficultyLevel {
        case .easy:
            if let index = models.characters.firstIndex(where: {
                $0 == stringToShow
            }) {
                models.characters.remove(at: index)
            }
            print(models.characters.count)
        case .medium:
            if let index = models.words.firstIndex(where: {
                $0 == stringToShow
            }) {
                models.words.remove(at: index)
            }
            print(models.words.count)
        case .hard:
            if let index = models.sentences.firstIndex(where: {
                $0 == stringToShow
            }) {
                models.sentences.remove(at: index)
            }
            print(models.sentences.count)
        }
    }
    
    public var allStudied: Bool {
        models.characters.isEmpty && models.words.isEmpty && models.characters.isEmpty
    }
}


