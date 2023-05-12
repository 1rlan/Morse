// Irlan Abushakhmanov, 2023

import Foundation

extension MorseConverter {
    private func convertLetterToMorse(_ input: Character) -> String {
        lettersToMorse[String(input)] ?? String.empty
    }
    
    internal func convertToMorse(from: String) -> String {
        let words = from.components(separatedBy: String.oneSpace).map { $0.map(convertLetterToMorse) }
        return words.map { word in
            word.joined(separator: String.oneSpace)
        }.joined(separator: String.threeSpaces)
    }
}
