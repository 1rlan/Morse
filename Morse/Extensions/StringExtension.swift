//
//  StringExtension.swift
//  course work
//
//  Created by Ирлан Абушахманов on 15.05.2023.
//

import Foundation

extension String {
    mutating func clean() {
        self = String.empty
    }
    
    func makeTicks() -> [Tick] {
        var ticks = [Tick]()
        
        let words = components(separatedBy: String.threeSpaces)
        for word in words {
            for char in word {
                switch char {
                case ".":
                    ticks.append(.short)
                case "-":
                    ticks.append(.long)
                case " ":
                    ticks.append(.pause)
                default:
                    ticks.append(.longPause)
                }
            }
            ticks.append(.longPause)
        }
        
        return ticks
    }
}
