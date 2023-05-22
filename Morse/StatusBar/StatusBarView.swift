//
//  StatusBarView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 13.05.2023.
//

import SwiftUI

struct StatusBarView: View {
    let switchButtonAction: () -> Void
    
    @Binding var translateState: TranslateState
    @Binding var tabSelected: TabBarState
    @Binding var title: String
    var backButtonAction: (() -> Void)? = nil
    
    
    var body: some View {
        switch tabSelected {
        case .translate:
            TranslateStatusBarView(
                translateState: $translateState,
                switchButtonAction: switchButtonAction
            )
        default:
            CommonStatusBarView(
                title: $title,
                backButtonAction: backButtonAction
            )
        }
    }
}

//struct StatusBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatusBarView(
//            switchButtonAction: {},
//            translateState: .constant(.morse),
//            tabSelected: .constant(.translate),
//            backButtonActive: .constant(true),
//            title: .constant("Title"),
//            backButtonAction: .constant { }
//        )
//    }
//}
