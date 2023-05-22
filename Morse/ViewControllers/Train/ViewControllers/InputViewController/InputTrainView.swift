//
//  InputTrainView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import SwiftUI

struct InputTrainView: View, Popable {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var barStates: BarsStates
    @ObservedObject var inputTrainState = InputTrainState()
    @State var inputString: String = String.empty
    @State var buttonDisabled = false
    @State var showAlert = false
    let converter = MorseConverter()
    
    let application = UIApplication.shared
    
    var body: some View {
        VStack {
            CommonStatusBarView(title: .constant("Input Train"), backButtonAction: popView)
            if let state = inputTrainState.stringToShow {
                Divider()
                Text(state.capitalized).font(.title).foregroundColor(application.leadingColor)
                Divider()
                HStack(alignment: .top) {
                    TextEditor(text: $inputString).disabled(true)
                        .padding(.leading, 15)
                        .frame(height: 120)
                        .onAppear {
                            UITextView.appearance().showsVerticalScrollIndicator = false
                        }
                    DeleteTextButton {
                        deleteTextButtonAction()
                    }.onlyIf(!inputString.isEmpty)
                }
                Divider()
                HStack {
                    CardButton(cardState: .skip, onTapClousre: skipTap, buttonDisabled: $buttonDisabled)
                    CardButton(cardState: .check, onTapClousre: checkInput, buttonDisabled: $buttonDisabled)
                }.padding(.horizontal, 16)
                Spacer()
                MorseInputSectionView(modifiableString: $inputString)
            } else {
                Spacer()
                Text(emptyViewTextToShow).padding(.horizontal, 16)
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func deleteTextButtonAction() {
        inputString.clean()
    }
    
    private func checkInput() {
        let translated = converter.convertToString(from: inputString)
        if (inputTrainState.stringToShow == translated) {
            showNewTitle(state: .success)
        } else {
            showNewTitle(state: .failure)
        }
    }
    
    func popView() {
        dismiss()
        barStates.activate()
    }
    
    private func skipTap() {
        inputTrainState.setNewValue()
    }
    
    private var emptyViewTextToShow: String {
        if inputTrainState.allStudied {
            return """
You seem to be the Morse guru.
You can reset your progress in the settings and practise typing again
"""
        } else {
            return """
This section has been passed!
You can start learning another one, just change the difficulty in the settings!
"""
        }
    }
    
    private func showNewTitle(state: Finish) {
        switch state {
        case .failure:
            inputTrainState.stringToShow = "❌❌❌"
            buttonDisabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                inputTrainState.setNewValue()
                buttonDisabled = false
            }
        case .success:
            inputTrainState.stringToShow = "✅✅✅"
            inputTrainState.deleteValue()
            buttonDisabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                inputTrainState.setNewValue()
                inputTrainState.saveData()
                buttonDisabled = false
            }
        }
    }
}

struct InputTrainView_Previews: PreviewProvider {
    static var previews: some View {
        InputTrainView(barStates: .init(), inputTrainState: .init())
    }
}

enum Finish {
    case success
    case failure
}
