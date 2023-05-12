import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: TabBarState
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                ForEach(TabBarState.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? .blue : .gray)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.white)
            .cornerRadius(30)
            .padding()
            .shadow(color: .gray, radius: 1, x: 0, y: 1)
        }
    }
}
