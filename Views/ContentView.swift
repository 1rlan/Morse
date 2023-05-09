
import SwiftUI

struct ContentView: View {
    @State private var tabSelected: TabBarState = .signal
    @State private var isMorseTranslate = true
    @State private var tabbarActive = true
    @State private var inputString = String.empty
    
    @FocusState private var inputFocused: Bool
    
    let application = UIApplication.shared

    var body: some View {
        if tabbarActive {
            switch tabSelected {
            case .translate:
                HStack {
                    Text(isMorseTranslate ? "Morse" : "English").tabTitle().frame(maxWidth: .infinity, alignment: .trailing)
                    
                    smallButton(signSymbol: .switchTranslation) {
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
                        .padding()
                        .frame(height: 50, alignment: .center)
                        .clipShape(Rectangle())
                    Image(systemName: "chevron.left").foregroundColor(application.leadingColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                }
            }
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
                    TrainingViewController(tabbarActive: $tabbarActive)
                case .settings:
                    SettingsViewController(isScreenLight: .constant(true))
                }
            }
        }
        
        VStack {
            if !inputFocused && tabbarActive {
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
