// Irlan Abushakhmanov, 2023


import SwiftUI

@ViewBuilder
func TrainButton(state: TrainState, tabbarActive: Binding<Bool>) -> some View {
    NavigationLink(
        destination: state.destination(tabbarActive: tabbarActive),
        label: {
            HStack {
                Text.halfTextLine(contentText: state.rawValue)
            }
            .padding()
            .frame(width: 340, height: 60)
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
        }
    )
}

private let application = UIApplication.shared
