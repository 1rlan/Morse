//
//  UDKeys.swift
//  course work
//
//  Created by Ирлан Абушахманов on 03.05.2023.
//

import Foundation

enum UDKeys {
    case symbolCards
    
    
    public var key: String {
        switch self {
        case .symbolCards:
            return "symbolCardsKey"
        }
    }
}
