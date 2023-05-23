// Irlan Abushakhmanov, 2023

import SwiftUI

struct TranslateView: View {
    @Binding var translateState: TranslateState
    @Binding var translateInputText: String
    
    var focused: FocusState<Bool>.Binding
    let converter = MorseConverter()
    
    private var translatedText: Binding<String> {
        Binding (
            get: {
                if translateState == .morse {
                    return converter.convertToString(from: translateInputText)
                } else {
                    return converter.convertToMorse(from: translateInputText)
                }
            },
            set: {_ in}
        )
    }

    let application = UIApplication.shared
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextEditor(text: $translateInputText).disabled(translateState == .morse)
                    .focused(focused)
                    .padding(.leading, 15)
                    .frame(height: 120)
                    .onAppear {
                        UITextView.appearance().showsVerticalScrollIndicator = false
                    }
                DeleteTextButton {
                    deleteTextButtonAction()
                }.onlyIf(!translateInputText.isEmpty)
            }
            Divider()
            
            TextEditor(text: translatedText)
                .padding(.horizontal, 15)
                .frame(height: 120)
                .disabled(true)
            
            Spacer()
        
            MorseInputSectionView(modifiableString: $translateInputText)
                .onlyIf(translateState == .morse)
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Done") {
                    focused.wrappedValue = false
                }
            }
        }
    }
    
    private func deleteTextButtonAction() {
        translateInputText.clean()
    }
}

