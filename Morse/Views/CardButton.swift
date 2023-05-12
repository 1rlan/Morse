//
//  CardButton.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import SwiftUI

struct CardButton: View {
    let cardState: CardButtonState
    let onTapClousre: () -> Void
    let application = UIApplication.shared
    
    var body: some View {
        Button(action: onTapClousre) {
            Text(cardState.rawValue)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(application.lightGrayColor)
                .cornerRadius(40)
        }
    }
}

struct CardButton_Previews: PreviewProvider {
    static var previews: some View {
        CardButton(cardState: .dontKnow, onTapClousre: {})
    }
}

enum CardButtonState: String {
    case know = "I know"
    case dontKnow = "I dont know"
}
