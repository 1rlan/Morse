// Irlan Abushakhmanov, 2023

import SwiftUI

struct SettingsView: View {
    var application = UIApplication.shared
    @State private var presentAlert = false
    
    var body: some View {
        VStack(spacing: 25) {
            SettingsSectionView(
                sectionTitleText: "Data",
                titleText: "Reset progress",
                dataText: nil,
                state: .common,
                tapAction: showAlert
            )
            SettingsSectionView(
                sectionTitleText: "Training",
                titleText: "Difficulty",
                dataText: nil,
                state: .list,
                tapAction: nil
            )
            SettingsSectionView(
                sectionTitleText: "Translation",
                titleText: "Screen light",
                dataText: nil,
                state: .toggle,
                tapAction: nil
            )
            Spacer()
        }.padding(.horizontal, sidePadding)
        .alert(isPresented: $presentAlert) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("All your progress will be deleted"),
                primaryButton: .destructive(Text("Reset")) {
                    resetProgress()
                },
                secondaryButton: .cancel()
            )
        }
    }

    private func resetProgress() {
        CustomUD.resetTrainingProgress()
    }
    
    private func showAlert() {
        presentAlert.toggle()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

private let sidePadding: CGFloat = 24
