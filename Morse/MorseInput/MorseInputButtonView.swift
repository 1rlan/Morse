//
//  MorseInputButtonUIModel.swift
//  course work
//
//  Created by Ирлан Абушахманов on 08.03.2023.
//

import SwiftUI

struct MorseInputButtonView: View {
    let application = UIApplication.shared
    
    let onTapClousre: () -> Void
    let text: String
    
    var body: some View {
        Button(action: onTapClousre) {
            Text(text).bold()
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                .background(application.lightGrayColor)
                .cornerRadius(20)
        }
    }
}
