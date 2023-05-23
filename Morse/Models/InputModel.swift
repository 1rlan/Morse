//
//  InputModel.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import Foundation

final class InputModel: Codable {
    public init(characters: [String], words: [String], sentences: [String]) {
        self.characters = characters
        self.sentences = sentences
        self.words = words
    }
    
    public var characters: [String]
    public var words: [String]
    public var sentences: [String]
    
    private enum CodingKeys: String, CodingKey {
       case characters
       case words
       case sentences
   }
       
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.characters = try container.decode([String].self, forKey: .characters)
        self.words = try container.decode([String].self, forKey: .words)
        self.sentences = try container.decode([String].self, forKey: .sentences)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(characters, forKey: .characters)
        try container.encode(words, forKey: .words)
        try container.encode(sentences, forKey: .sentences)
    }
}

