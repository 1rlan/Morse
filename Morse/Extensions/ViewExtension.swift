//
//  ViewExtension.swift
//  course work
//
//  Created by Ирлан Абушахманов on 14.05.2023.
//

import SwiftUI

struct OnlyIfModifier: ViewModifier {
    var condition: Bool

    func body(content: Content) -> some View {
        if condition {
            content
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    func onlyIf(_ condition: Bool) -> some View {
        modifier(OnlyIfModifier(condition: condition))
    }
}
