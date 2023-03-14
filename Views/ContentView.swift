
import SwiftUI

struct ContentView: View {
    @State private var tabSelected: TabBarState = .translate
    @State private var isMorseTranslate = true
    @State private var inputString = String.empty
    
    @FocusState private var inputFocused: Bool

    @ViewBuilder
    var body: some View {
        switch tabSelected {
        case .translate:
            HStack {
                Text(isMorseTranslate ? "Morse" : "English").tabTitle().frame(maxWidth: .infinity, alignment: .trailing)
                
                SwitchLanguageButton() {
                    isMorseTranslate.toggle()
                    self.inputString = String.empty
                }
                
                Text(isMorseTranslate ? "English" : "Morse").tabTitle().frame(maxWidth: .infinity, alignment: .leading)
            }.padding()
                .frame(height: 55, alignment: .center)
                .clipShape(Rectangle())
        default:
            ZStack {
                Text(tabSelected.tabString)
                    .tabTitle()
            }.padding()
                .frame(height: 50, alignment: .center)
                .clipShape(Rectangle())
        }
        ZStack {
            VStack {
                switch tabSelected {
                case .signal:
                    SignalViewController()
                case .translate:
                    TranslateViewController(
                        isMorseTranslate: $isMorseTranslate,
                        inputText: $inputString,
                        focused: $inputFocused)
                case .training:
                    TrainingViewController()
                case .settings:
                    SettingsViewController(isScreenLight: .constant(true))
                }
            }
        }
        
        VStack {
            if !inputFocused {
                TabBar(selectedTab: $tabSelected)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
    }
}
