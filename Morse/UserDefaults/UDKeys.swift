//
//  UDKeys.swift
//  course work
//
//  Created by Ирлан Абушахманов on 03.05.2023.
//

import Foundation

enum UDKeys: String {
    case symbolCards
    case difficultyCards
    case screenLight
    case inputModel
    
    
    public var key: String {
        rawValue + "key"
    }
}
