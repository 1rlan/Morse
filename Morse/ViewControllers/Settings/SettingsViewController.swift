// Irlan Abushakhmanov, 2023

import SwiftUI

struct SettingsViewController: View {
    
    var application = UIApplication.shared
    
    @Binding
    var isScreenLight: Bool
    
    var body: some View {
        VStack(spacing: 25) {
            VStack {
                Text("Data").settingsTitle()
                Text.textLine(contentText: "Language", dataText: "English")
                    .padding(.vertical, 14)
                    .background(application.lightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .padding(.horizontal, sidePadding)
            }
            
            VStack {
                Text("Training").settingsTitle()
                Text.textLine(contentText: "Difficulty", dataText: "Easy")
                    .padding(.vertical, 14)
                    .background(application.lightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .padding(.horizontal, sidePadding)
            }

            VStack {
                Text("Translation").settingsTitle()
                VStack {
                    Text.textLine(contentText: "Long tick", dataText: "0.2s").padding(.bottom, 6).padding(.top, 14)
                    Divider()
                    Text.textLine(contentText: "Long tick", dataText: "0.6s").padding(.vertical, 6)
                    Divider()
                    Text.textWithToggle(contentText: "Screen flash").padding(.bottom, 12)
                }
                    .background(application.lightGrayColor)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .padding(.horizontal, sidePadding)
            }
            
            Spacer()
        }
    }
}

struct SettingsViewController_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewController(isScreenLight: .constant(true))
    }
}

private let sidePadding: CGFloat = 24
