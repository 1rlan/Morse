// Irlan Abushakhmanov, 2023

import SwiftUI

struct SignalViewController: View {
    
    @State private var inputText = String.empty
    
    @ViewBuilder
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                TextEditor(text: self.$inputText).disabled(true)
                    .padding(.leading, 14)
                    .frame(maxHeight: 120)
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
            
            VStack {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(SignalState.allCases, id: \.rawValue) { state in
                        SignalButtonUIModel(image: state.image, tapClousre: state.translateString(stringToTranslate: inputText))
                    }
                }.padding(.horizontal, 24)
                .padding(.top, 18)
            }
            
            Spacer()
            
            MorseInputSectionView(modifiableString: $inputText)
        }
    }
}

struct SignalViewController_Previews: PreviewProvider {
    static var previews: some View {
        SignalViewController()
    }
}


private let gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
