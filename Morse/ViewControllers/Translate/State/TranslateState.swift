//
//  TranslateState.swift
//  course work
//
//  Created by Ирлан Абушахманов on 13.05.2023.
//

import Foundation

enum TranslateState: String {
    case morse, english
    
    var fromText: String {
        rawValue.uppercaseFirstCharacter()
    }
    
    var toText: String {
        reversedValue.rawValue.uppercaseFirstCharacter()
    }
    
    mutating func toggle() {
        self = reversedValue
    }
    
    private var reversedValue: TranslateState {
        (self == .english) ? .morse : .english
    }
}

private extension String {
    func uppercaseFirstCharacter() -> String {
        prefix(1).uppercased() + dropFirst()
    }
}
