// Irlan Abushakhmanov, 2023

import SwiftUI

struct SmallButton: View {
    let signSymbol: Sign
    let tapAction: () -> Void
    
    var body: some View {
        Image(systemName: signSymbol.rawValue)
            .scaleEffect(1.25)
            .foregroundColor(.blue)
            .font(.system(size: 20))
            .frame(maxWidth: signSymbol.signWidth, alignment: .center).onTapGesture {
                tapAction()
        }
    }
    
    enum Sign: String {
        case switchTranslation = "arrow.left.arrow.right"
        case returnView = "chevron.left"
        
        var signWidth: CGFloat {
            switch self {
            case .switchTranslation:
                return .infinity
            case .returnView:
                return 20
            }
        }
    }
}

