//
//  SettingsSectionView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import SwiftUI

struct SettingsSectionView: View {
    let sectionTitleText: String
    let titleText: String
    let dataText: String? 
    let state: SettingsButtonState
    let tapAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Text(sectionTitleText).settingsTitle()
            SettingsButtonView(
                tilteText: titleText,
                dataText: dataText,
                state: state,
                tapAction: tapAction
            )
        }
    }
}

struct SettingsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSectionView(
            sectionTitleText: "Section Title",
            titleText: "Small Title",
            dataText: nil,
            state: .toggle,
            tapAction: nil
        )
    }
}
