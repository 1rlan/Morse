//
//  UDInitialValues.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import Foundation

struct InitialValues {
    let symbolModels = {
        return [
            SymbolModel(symbol: "A", morse: "•-"),
            SymbolModel(symbol: "B", morse: "-•••"),
            SymbolModel(symbol: "C", morse: "-•-•"),
            SymbolModel(symbol: "D", morse: "-••"),
            SymbolModel(symbol: "E", morse: "•"),
            SymbolModel(symbol: "F", morse: "••-•"),
            SymbolModel(symbol: "G", morse: "--•"),
            SymbolModel(symbol: "H", morse: "••••"),
            SymbolModel(symbol: "I", morse: "••"),
            SymbolModel(symbol: "J", morse: "•---"),
            SymbolModel(symbol: "K", morse: "-•-"),
            SymbolModel(symbol: "L", morse: "•-••"),
            SymbolModel(symbol: "M", morse: "--"),
            SymbolModel(symbol: "N", morse: "-•"),
            SymbolModel(symbol: "O", morse: "---"),
            SymbolModel(symbol: "P", morse: "•--•"),
            SymbolModel(symbol: "Q", morse: "--•-"),
            SymbolModel(symbol: "R", morse: "•-•"),
            SymbolModel(symbol: "S", morse: "•••"),
            SymbolModel(symbol: "T", morse: "-"),
            SymbolModel(symbol: "U", morse: "••-"),
            SymbolModel(symbol: "V", morse: "•••-"),
            SymbolModel(symbol: "W", morse: "•--"),
            SymbolModel(symbol: "X", morse: "-••-"),
            SymbolModel(symbol: "Y", morse: "-•--"),
            SymbolModel(symbol: "Z", morse: "--••"),
            SymbolModel(symbol: "1", morse: "•----"),
            SymbolModel(symbol: "2", morse: "••---"),
            SymbolModel(symbol: "3", morse: "•••--"),
            SymbolModel(symbol: "4", morse: "••••-"),
            SymbolModel(symbol: "5", morse: "•••••"),
            SymbolModel(symbol: "6", morse: "-••••"),
            SymbolModel(symbol: "7", morse: "--•••"),
            SymbolModel(symbol: "8", morse: "---••"),
            SymbolModel(symbol: "9", morse: "----•"),
            SymbolModel(symbol: "0", morse: "-----"),
        ]
    }()
    
    let inputModel = {
        return InputModel(
            characters: ["a", "b", "7", "d", "e", "f", "2", "h", "i", "j", "k", "1", "m", "n", "o", "p", "q", "r", "5", "t"],
            words: [
                "apple", "dance", "happy", "table",
                "green", "music", "funny", "light",
                "smile", "river", "hello", "black",
                "cloud", "bread", "dream", "spark",
                "house", "beach", "sunny", "sweet"
            ],
            sentences: [
                "The sun is shining",
                "I like to eat pizza",
                "She walked in the park",
                "He plays guitar well",
                "We went to the beach",
                "They read books together",
                "I love listening to music",
                "The cat is sleeping",
                "He smiled and waved",
                "She wore a beautiful dress",
                "The car drove very fast",
                "I enjoyed the movie",
                "They cooked dinner together",
                "He ran in the marathon",
                "She wrote a letter to her friend",
                "We played soccer in the field",
                "The dog chased its tail",
                "He climbed the mountain",
                "She drew a picture of a flower",
                "We watched the sunset"
            ]
        )
    }()
}
