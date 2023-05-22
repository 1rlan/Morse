//
//  DifficultyState.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import Foundation

enum DifficultyState: String, CaseIterable, Identifiable {
    case easy, medium, hard
    var id: Self { self }
    
    init?(raw: String) {
        self.init(rawValue: raw)
    }
}
