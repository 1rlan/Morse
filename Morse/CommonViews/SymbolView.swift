//
//  SymbolCell.swift
//  course work
//
//  Created by Ирлан Абушахманов on 01.05.2023.
//

import SwiftUI

struct SymbolView: View {
    let model: SymbolModel
    
    var body: some View {
        HStack {
            Text(model.symbol)
            Spacer()
            Text(model.morse)
        }.padding(.horizontal, 24)
         .padding(.bottom, 6)
    }
}
