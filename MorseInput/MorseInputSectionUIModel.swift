//
//  SwiftUIView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 08.03.2023.
//

import SwiftUI

struct MorseInputSectionUIModel: View {
    @Binding var modifiableString: String
    
    var body: some View {
        VStack {
            HStack {
                ForEach([MorseInputState.dot, MorseInputState.dash], id: \.rawValue) { state in
                    MorseInputButtonUIModel(onTapClousre: clousre(state: state), text: state.rawValue)
                }
            }.padding(.horizontal, 14)
            HStack {
                ForEach([MorseInputState.space, MorseInputState.longspace, MorseInputState.delete], id: \.rawValue) { state in
                    MorseInputButtonUIModel(onTapClousre: clousre(state: state), text: state.rawValue)
                }
            }.padding(.horizontal, 14)
        }
        
    }
    
    func clousre(state: MorseInputState) -> () -> Void {
        switch state {
        case .dot:
            return { modifiableString += "." }
        case .dash:
            return { modifiableString += "-" }
        case .space:
            return { modifiableString += " " }
        case .longspace:
            return { modifiableString += "   "}
        case .delete:
            return {
                if !modifiableString.isEmpty {
                    modifiableString = modifiableString.dropLast(1).description
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MorseInputSectionUIModel(modifiableString: .constant(""))
    }
}
