// Irlan Abushakhmanov, 2023

import SwiftUI

struct SignalButtonUIModel: View {
    
    let application = UIApplication.shared
    let image: Image
    let tapClousre: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Button(action: tapClousre) {
                    image
                        .foregroundColor(application.leadingColor)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity)
                        .frame(height: geometry.size.width)
                        .overlay {
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(application.leadingColor, lineWidth: 1)
                        .onTapGesture {
                            tapClousre()
                        }
                    }
                }
            }
        }
    }
}
