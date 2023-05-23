//
//  SymbolModel.swift
//  course work
//
//  Created by Ирлан Абушахманов on 01.05.2023.
//

import Foundation

final public class SymbolModel: Codable, ObservableObject, Equatable {
    public var symbol: String
    public var morse: String
    
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
    
    public static func == (lhs: SymbolModel, rhs: SymbolModel) -> Bool {
        lhs.morse == rhs.morse && lhs.symbol == rhs.symbol
    }
}
