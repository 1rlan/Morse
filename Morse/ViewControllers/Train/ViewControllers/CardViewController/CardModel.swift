//
//  CardModel.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import Foundation

class CardModel: ObservableObject {
    init() {
        do {
            models = try CustomUD.fetchData(keyState: .symbolCards, castTo: [SymbolModel].self)
        } catch {
            fatalError("Cant fetch cardModels")
        }
        setRandomModel()
    }
    
    private var models: [SymbolModel]
    @Published var model: SymbolModel?
    
    public func setRandomModel() {
        self.model = models.randomElement()
    }
    
    public func saveData() {
        do {
            try CustomUD.setValue(data: models, keyState: .symbolCards)
        } catch {
            fatalError("Cant save cardModels")
        }
    }
    
    public func removeElement() {
        if let index = models.firstIndex(where: {
            $0 == model
        }) {
            models.remove(at: index)
        }
    }
}
