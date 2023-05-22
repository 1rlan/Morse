
import SwiftUI

struct ContentView: View {
    @StateObject private var barStates = BarsStates()
    @State private var translateState: TranslateState = .morse
    @State private var tabSelected: TabBarState = .translate
    @State private var title = TabBarState.translate.tabString
    @State private var translateInputText = String.empty
    
    @FocusState private var inputFocused: Bool
    
    let application = UIApplication.shared

    var body: some View {
        if barStates.isActive {
            StatusBarView(
                switchButtonAction: {
                    translateInputText.clean()
                    translateState.toggle()
                },
                translateState: $translateState,
                tabSelected: $tabSelected,
                title: $title
            )
        }
        switch tabSelected {
        case .signal:
            SignalView(barStates: barStates)
        case .translate:
            TranslateView(
                translateState: $translateState,
                translateInputText: $translateInputText,
                focused: $inputFocused
            )
        case .training:
            TrainingView(barStates: barStates)
        case .settings:
            SettingsView()
        }
        if !inputFocused && barStates.isActive {
            TabBar(selectedTab: $tabSelected, title: $title)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().previewInterfaceOrientation(.portrait)
//    }
//}
