// Irlan Abushakhmanov, 2023

import SwiftUI

enum TrainState: String, CaseIterable {
    case words = "Words"
    case cards = "Cards"
    case cheat = "Cheat sheet"
    case abbreviations = "Abbreviations"
    
    public func destination(tabbarActive: Binding<Bool>) -> some View {
        switch self {
        case .words:
            return AnyView(CardView(tabbarActive: tabbarActive, state: self))
        case .cards:
            return AnyView(CardView(tabbarActive: tabbarActive, state: self))
        case .cheat:
            return AnyView(DataView(tabbarActive: tabbarActive, state: self))
        case .abbreviations:
            return AnyView(DataView(tabbarActive: tabbarActive, state: self))
        }
    }
}
