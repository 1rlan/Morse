//
//  BarStates.swift
//  course work
//
//  Created by Ирлан Абушахманов on 15.05.2023.
//

import Foundation

class BarsStates: ObservableObject {
    @Published private var active = true
    
    func activate() {
        active = true
    }
    
    func deactivate() {
        active = false
    }
    
    var isActive: Bool {
        active
    }
}
