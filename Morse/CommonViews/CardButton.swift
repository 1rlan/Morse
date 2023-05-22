//
//  CardButton.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import SwiftUI

struct CardButton: View {
    let cardState: TrainButtonState
    let onTapClousre: () -> Void
    let application = UIApplication.shared
    @Binding var buttonDisabled: Bool
    
    var body: some View {
        Button(action: onTapClousre) {
            Text(cardState.rawValue)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: cardState.buttonHeight)
                .background(application.lightGrayColor)
                .cornerRadius(28)
        }.disabled(buttonDisabled)
    }
}

struct CardButton_Previews: PreviewProvider {
    static var previews: some View {
        CardButton(cardState: .dontKnow, onTapClousre: {}, buttonDisabled: .constant(false))
    }
}

enum TrainButtonState: String {
    case know = "I know"
    case dontKnow = "I dont know"
    case skip = "Skip"
    case check = "Check"
    
    var buttonHeight: CGFloat {
        switch self {
        case .know, .dontKnow:
            return 80
        case .skip, .check:
            return 40
        }
    }
}
