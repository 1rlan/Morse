//
//  StatusBarCommonView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 13.05.2023.
//

import SwiftUI

struct CommonStatusBarView: View {
    let application = UIApplication.shared
    
    @Binding var title: String
    var backButtonAction: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Text(title).tabTitle()
            if let backButtonAction {
                PopButtonView(
                    backButtonAction: backButtonAction
                )
            }
        }
    }
}

struct StatusBarCommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonStatusBarView(
            title: .constant("Title"),
            backButtonAction: {}
        )
    }
}
