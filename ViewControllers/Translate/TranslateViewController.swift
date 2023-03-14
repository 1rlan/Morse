// Irlan Abushakhmanov, 2023

import SwiftUI

struct TranslateViewController: View {
    @Binding var isMorseTranslate: Bool
    @Binding var inputText: String
    
    var focused: FocusState<Bool>.Binding
    
    private let converter = MorseConverter()
    
    private var translatedText: Binding<String> {
        Binding (
            get: {
                if !isMorseTranslate {
                    return converter.convertToMorse(from: inputText)
                } else {
                    return converter.convertToString(from: inputText)
                }
            },
            set: {
                print($0)
            }
        )
    }
    
    let application = UIApplication.shared
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextEditor(text: self.$inputText).disabled(isMorseTranslate ? true : false)
                    .focused(focused)
                    .padding(.leading, 15)
                    .frame(height: 120)
                    .foregroundColor(.primary)
                    .onAppear {
                        UITextView.appearance().showsVerticalScrollIndicator = false
                    }
                  
                if (!inputText.isEmpty) {
                    DeleteTextButton {
                        inputText = String.empty
                    }
                }
            }
            Divider()
            
            TextEditor(text: translatedText)
                .padding(.horizontal, 15)
                .frame(height: 120)
                .disabled(true)
            Spacer()
            
            if (isMorseTranslate) {
                MorseInputSectionUIModel(modifiableString: $inputText)
            }
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Done") {
                    focused.wrappedValue = false
                }
            }
        }
    }
}

