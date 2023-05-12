// Irlan Abushakhmanov, 2023

import Foundation

enum Tick: String {
    case long
    case short
    case pause
    case longPause
    
    var duration: Double {
        switch self {
        case .short:
            return shortDuration
        case .long:
            return shortDuration * shortLongRatio
        case .pause:
            return pauseDuration
        case .longPause:
            return pauseDuration * shortLongRatio
        }
    }
}

private let shortDuration = 0.2
private let pauseDuration = 0.2
private let shortLongRatio = 3.0
