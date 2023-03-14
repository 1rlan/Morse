//
//  StacksExtensions.swift
//  course work
//
//  Created by Ирлан Абушахманов on 24.02.2023.
//

import SwiftUI

extension HStack {
    public func textLine(contentText: String, dataText: String) -> some View {
        Group {
            Text(contentText).padding(.leading, 8)
            Spacer()
            Text(dataText).padding(.trailing, 8)
                .foregroundColor(UIApplication.shared.darkGrayColor)
        }
    }
}
