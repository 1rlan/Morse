//
//  SettingsPickerView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import SwiftUI

struct SettingsPickerView: View {
    init() {
        _selectedItem = State(
            initialValue: DifficultyState(
                raw: UserDefaults.standard.string(forKey: UDKeys.difficultyCards.key) ?? "easy"
            ) ?? .easy
        )
    }
    
    let application = UIApplication.shared
    @State var selectedItem: DifficultyState

    var body: some View {
        Picker("Difficulty", selection: $selectedItem) {
            ForEach(DifficultyState.allCases, id: \.rawValue) { state in
                Text(state.rawValue.capitalized).tag(state.id)
            }
        }.onChange(of: selectedItem) { newDiff in
            saveDifficulty(newDiff: newDiff.rawValue)
        }.accentColor(application.darkGrayColor)
    }
    
    private func saveDifficulty(newDiff: String) {
        UserDefaults.standard.set(newDiff, forKey: UDKeys.difficultyCards.key)
    }
}

struct SettingsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPickerView()
    }
}
