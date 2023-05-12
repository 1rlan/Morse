// Irlan Abushakhmanov, 2023

import SwiftUI

struct DataView: View {
    @Binding var tabbarActive: Bool
    @Environment(\.presentationMode) var presentationMode
    
    let state: TrainState
    
    var body: some View {
        ButtonTitle(tapAction: popView, title: state.rawValue)
        ScrollView {
            VStack {
                switch state {
                case .abbreviations:
                    ForEach(abbreviationModels, id: \.abbreviation) { model in
                        AbbreviationCell(model: model)
                        Divider().padding(.horizontal, 20)
                    }
                case .cheat:
                    ForEach(symbolModels, id: \.symbol) { model in
                        SymbolView(model: model)
                        Divider().padding(.horizontal, 20)
                    }
                default:
                    EmptyView()
                }
            }
        }.navigationBarBackButtonHidden(true)
        .onAppear {
            tabbarActive = false
        }
    }
    
    func popView() {
        tabbarActive = true
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(tabbarActive: .constant(true), state: .abbreviations)
    }
}




