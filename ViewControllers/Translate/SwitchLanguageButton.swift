// Irlan Abushakhmanov, 2023

import SwiftUI

struct SwitchLanguageButton: View {
    
    let tapAction: () -> Void
    
    var body: some View {
        Image(systemName: "arrow.left.arrow.right")
            .scaleEffect(1.25)
            .foregroundColor(.blue)
            .font(.system(size: 20))
            .frame(maxWidth: .infinity, alignment: .center).onTapGesture {
                tapAction()
            }
    }
}

