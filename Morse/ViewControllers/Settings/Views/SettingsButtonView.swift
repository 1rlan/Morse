//
//  SettingsButtonView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 14.05.2023.
//

import SwiftUI

struct SettingsButtonView: View {
    private let application = UIApplication.shared
    
    let tilteText: String
    let dataText: String?
    let state: SettingsButtonState
    let tapAction: (() -> Void)?
    
    
    var body: some View {
        Button(action: {
            tapAction?()
        }) {
            HStack {
                Text(tilteText).padding(.leading, 20).foregroundColor(.black)
                Spacer()
                rightSection.padding(.trailing, 20)
            }.frame(height: 54)
        }
        .buttonStyle(SettingsButtonStyle(isPressColorChangeActive: tapAction != nil))
    }
        
    @ViewBuilder
    private var rightSection: some View {
        switch state {
        case .toggle:
            SettingsToggleView()
        case .list:
            SettingsPickerView()
        case .common:
            if let dataText {
                Text(dataText).foregroundColor(application.darkGrayColor)
            }
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView(
            tilteText: "Title",
            dataText: "10%",
            state: .list,
            tapAction: nil
        )
    }
}

private struct SettingsButtonStyle: ButtonStyle {
    let isPressColorChangeActive: Bool
    let application = UIApplication.shared
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? pressedColor : application.lightGrayColor)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
    
    private var pressedColor: Color {
        isPressColorChangeActive ? .white : application.lightGrayColor
    }
}
