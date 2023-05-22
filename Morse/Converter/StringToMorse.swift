// Irlan Abushakhmanov, 2023

import SwiftUI

extension MorseConverter {
    private func convertLetterToMorse(_ input: Character) -> String {
        Self.lettersToMorse[input] ?? String.empty
    }
    
    internal func convertToMorse(from: String) -> String {
        let words = from.components(separatedBy: String.oneSpace)
        return words.map { word in
            word.map { char in
                convertLetterToMorse(char)
            }.joined(separator: String.oneSpace)
        }.joined(separator: String.threeSpaces)
    }
}
