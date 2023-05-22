//
//  TranslateStatusBar.swift
//  course work
//
//  Created by Ирлан Абушахманов on 13.05.2023.
//

import SwiftUI

struct TranslateStatusBarView: View {
    @Binding var translateState: TranslateState
    
    let switchButtonAction: () -> Void
    
    var body: some View {
        HStack {
            Text(translateState.fromText).tabTitle().frame(maxWidth: .infinity, alignment: .trailing)
            
            SmallButton(signSymbol: .switchTranslation) {
                switchButtonAction()
            }
            
            Text(translateState.toText).tabTitle().frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TranslateStatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateStatusBarView(translateState: .constant(.morse), switchButtonAction: {})
    }
}
