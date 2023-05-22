import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: TabBarState
    @Binding var title: String
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    @ViewBuilder
    var body: some View {
        HStack {
            ForEach(TabBarState.allCases, id: \.rawValue) { tab in
                Spacer()
                Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                    .foregroundColor(tab == selectedTab ? .blue : .gray)
                    .font(.system(size: 20))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            tapAction(newSelection: tab)
                        }
                    }
                Spacer()
            }
        }
        .frame(height: 60)
        .background(.white)
        .cornerRadius(30)
        .padding()
        .shadow(color: .gray, radius: 1, x: 0, y: 1)
    }
    
    private func tapAction(newSelection: TabBarState) {
        selectedTab = newSelection
        title = newSelection.tabString
    }
}
