// Irlan Abushakhmanov, 2023

import Foundation

extension MorseConverter {
    private func convertMorseToLetter(_ input: String) -> String {
        morseToLetter[String(input)] ?? "?"
    }
    
    func convertToString(from: String) -> String {
        guard !from.isEmpty else {
            return from
        }
        
        let words = from.components(separatedBy: String.threeSpaces).map { $0.components(separatedBy: String.oneSpace) }
        let ans2 = words.map { word in
            word.map {seq in
                convertMorseToLetter(seq)
            }.joined(separator: "")
        }.joined(separator: " ")
        print(ans2)
        
        var ans = [String]()

        for str in words {
            var tmp = ""
            for s in str {
                tmp += convertMorseToLetter(s)
            }
            ans.append(tmp)
        }

        return ans2
    }
}
