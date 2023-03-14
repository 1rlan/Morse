// Irlan Abushakhmanov, 2023

import SwiftUI

struct CustomDivider: View {
    
    public init(progress: Int) {
        self.color = Color.colorForNumber(1)
    }
    
    var color: Color
    let height: CGFloat = 2
    let opacity: Double = 2
    
    var body: some View {
        Group {
            Rectangle()
        }
        .frame(height: height)
        .padding(.leading, 8)
        .foregroundColor(color)
        .opacity(opacity)
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
