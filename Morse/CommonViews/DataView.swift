// Irlan Abushakhmanov, 2023

import SwiftUI

struct DataView: View, Popable {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var barStates: BarsStates
    
    let state: TrainState
    var body: some View {
        CommonStatusBarView(title: .constant(state.rawValue), backButtonAction: popView)
        ScrollView {
            VStack {
                switch state {
                case .abbreviations:
                    ForEach(abbreviationModels, id: \.abbreviation) { model in
                        AbbreviationView(model: model)
                        Divider().padding(.horizontal, 20)
                    }
                case .cheat:
                    ForEach(InitialValues().symbolModels, id: \.symbol) { model in
                        SymbolView(model: model)
                        Divider().padding(.horizontal, 20)
                    }
                default:
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func popView() {
        dismiss()
        barStates.activate()
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(barStates: .init(), state: .abbreviations)
    }
}




