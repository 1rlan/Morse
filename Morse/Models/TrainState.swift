// Irlan Abushakhmanov, 2023

import SwiftUI

enum TrainState: String, CaseIterable {
    case words = "Words"
    case cards = "Input Train"
    case cheat = "Cheat sheet"
    case abbreviations = "Abbreviations"
    
    public func destination(barStates: BarsStates) -> any View {
        switch self {
        case .words:
            return CardView(barStates: barStates)
        case .cards:
            return InputTrainView(barStates: barStates)
        case .cheat:
            return DataView(barStates: barStates, state: self)
        case .abbreviations:
            return DataView(barStates: barStates, state: self)
        }
    }
}
