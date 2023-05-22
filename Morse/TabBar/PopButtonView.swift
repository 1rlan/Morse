//
//  PopButtonView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 13.05.2023.
//

import SwiftUI
import UIKit

struct PopButtonView: View {
    let application = UIApplication.shared
    
    var backButtonAction: () -> Void
    
    var body: some View {
        Button(action: {
            backButtonAction()
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 24))
                .foregroundColor(application.leadingColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
        }
    }
}

struct PopButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PopButtonView(
            backButtonAction: {}
        )
    }
}
