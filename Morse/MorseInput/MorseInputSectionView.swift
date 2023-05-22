//
//  SwiftUIView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 08.03.2023.
//

import SwiftUI

struct MorseInputSectionView: View {
    @Binding var modifiableString: String
    
    var body: some View {
        VStack {
            HStack {
                ForEach([MorseInputState.dot, MorseInputState.dash], id: \.rawValue) { state in
                    MorseInputButtonView(onTapClousre: clousre(state: state), text: state.rawValue)
                }
            }.padding(.horizontal, 14)
            HStack {
                ForEach([MorseInputState.space, MorseInputState.longspace, MorseInputState.delete], id: \.rawValue) { state in
                    MorseInputButtonView(onTapClousre: clousre(state: state), text: state.rawValue)
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
            return { modifiableString += String.oneSpace }
        case .longspace:
            return { modifiableString += String.threeSpaces}
        case .delete:
            return {
                if !modifiableString.isEmpty {
                    modifiableString = modifiableString.dropLast(1).description
                }
            }
        }
    }
}
