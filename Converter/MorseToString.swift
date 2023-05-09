// Irlan Abushakhmanov, 2023

import Foundation

extension MorseConverter {
    private func convertMorseToLetter(_ input: String) -> String {
        morseToLetter[String(input)] ?? "?"
    }
    
    internal func convertToString(from: String) -> String {
        guard !from.isEmpty else {
            return from
        }
        
        let words = from.components(separatedBy: String.threeSpaces).map { $0.components(separatedBy: String.oneSpace) }
        return words.map { word in
            word.map {seq in
                convertMorseToLetter(seq)
            }.joined(separator: String.empty)
        }.joined(separator: String.oneSpace)
    }
}
