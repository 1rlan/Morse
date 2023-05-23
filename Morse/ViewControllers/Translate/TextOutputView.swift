//
//  TextOutputView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 23.05.2023.
//

import SwiftUI

struct TextOutputView: View {
    @Binding var translatedText: String
    
    var body: some View {
        TextEditor(text: translatedText)
            .padding(.horizontal, 15)
            .frame(height: 120)
            .disabled(true)
    }
}

struct TextOutputView_Previews: PreviewProvider {
    static var previews: some View {
        TextOutputView()
    }
}
