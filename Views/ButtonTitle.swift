//
//  ButtonTitle.swift
//  course work
//
//  Created by Ирлан Абушахманов on 01.05.2023.
//

import SwiftUI

struct ButtonTitle: View {
    let tapAction: () -> Void
    let title: String
    
    var body: some View {
        HStack {
            smallButton(signSymbol: .returnView) {
                tapAction()
            }

            Text(title)
                .tabTitle()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .padding(.trailing, 16 + 20)
        }.padding()
    }
}

struct ButtonTitle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTitle(tapAction: {}, title: "")
    }
}
