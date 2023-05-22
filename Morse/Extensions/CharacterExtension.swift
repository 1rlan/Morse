//
//  CharacterExtensiob.swift
//  course work
//
//  Created by Ирлан Абушахманов on 22.05.2023.
//

import Foundation

extension Character {
    var validMorse: Bool {
        isNumber || isEnglish
    }
    
    private var isEnglish: Bool {
        guard let ascii = asciiValue else { return false }
        return ascii > Character("a").asciiValue! && ascii < Character("Z").asciiValue!
    }
}
