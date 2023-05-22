// Irlan Abushakhmanov, 2023

import SwiftUI

struct SignalView: View {
    @State var inputText = String.empty
    @State var ticks: [Tick] = [.long, .long, .pause, .long]
    @ObservedObject var barStates: BarsStates
    let screenLight = UserDefaults.standard.bool(forKey: UDKeys.screenLight.key)
    let application = UIApplication.shared
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    TextEditor(text: self.$inputText).disabled(true)
                        .padding(.leading, 14)
                        .frame(maxHeight: 120)
                        .onAppear {
                            UITextView.appearance().showsVerticalScrollIndicator = false
                        }
                    DeleteTextButton {
                        deleteTextButtonAction()
                    }.onlyIf(!inputText.isEmpty)
                }
                
                Divider()
                
                HStack {
                    SignalButtonView(state: .sound, inputString: $inputText)
                    SignalButtonView(state: .vibration, inputString: $inputText)
                    if screenLight {
                        SignalButtonNavigationLink(
                            barStates: barStates,
                            ticks: Ticks(ticks: inputText.makeTicks())
                        )
                    } else {
                        SignalButtonView(state: .flash, inputString: $inputText)
                    }
                }.padding(.horizontal, 16).padding(.top, 16)
                
                Spacer()
                
                MorseInputSectionView(modifiableString: $inputText)
            }
        }
    }
    
    private func deleteTextButtonAction() {
        inputText.clean()
    }
}

struct SignalView_Previews: PreviewProvider {
    static var previews: some View {
        SignalView(barStates: .init())
    }
}
