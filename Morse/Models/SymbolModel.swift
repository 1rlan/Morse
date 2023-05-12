//
//  SymbolModel.swift
//  course work
//
//  Created by Ирлан Абушахманов on 01.05.2023.
//

import Foundation

public class SymbolModel: Codable, ObservableObject {
    @Published public var symbol: String
    @Published public var morse: String
    
    private enum CodingKeys: String, CodingKey {
       case symbol
       case morse
   }
       
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.morse = try container.decode(String.self, forKey: .morse)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(morse, forKey: .morse)
    }
    
    public init(symbol: String, morse: String) {
        self.symbol = symbol
        self.morse = morse
    }
}

public let symbolModels = [
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
