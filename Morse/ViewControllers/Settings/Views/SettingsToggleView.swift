//
//  SettingsToggleView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import SwiftUI

struct SettingsToggleView: View {
    @State var toggleState = UserDefaults.standard.bool(forKey: UDKeys.screenLight.key)
    
    var body: some View {
        Toggle(isOn: $toggleState) {}
        .onChange(of: toggleState) { newValue in
            saveToggleState(newValue: newValue)
        }
    }
    
    private func saveToggleState(newValue: Bool) {
        UserDefaults.standard.set(newValue, forKey: UDKeys.screenLight.key)
    }
}

struct SettingsToggleView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsToggleView()
    }
}
