//
//  AbbreviationCell.swift
//  course work
//
//  Created by Ирлан Абушахманов on 01.05.2023.
//

import SwiftUI

struct AbbreviationCell: View {
    let model: AbbreviationModel
    
    var body: some View {
        VStack {
            HStack {
                Text(model.abbreviation).bold()
                Spacer()
                Text(model.morse).bold()
            }.padding(.horizontal, 24)
                .padding(.bottom, 6)
            Text(model.description).italic()
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
        }.padding(.vertical, 4)
    }
}
