// Irlan Abushakhmanov, 2023

import SwiftUI

enum Tick: String {
    case long
    case short
    case pause
    case longPause
    
    var duration: Double {
        switch self {
        case .short:
            return 0.1 * ratio
        case .long:
            return 0.3 * ratio
        case .pause:
            return 0.3 * ratio
        case .longPause:
            return 0.7 * ratio
        }
    }
    
    var color: Color {
        switch self {
        case .long, .short:
            return Color.white
        case .longPause, .pause:
            return Color.black
        }
    }
}

private let ratio: Double = 3
