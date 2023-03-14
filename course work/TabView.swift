import SwiftUI

struct CustomTab: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                Text(selectedTab.tabString)
                    .font(.custom("SF Pro Display", fixedSize: 18))
                    .foregroundColor(.gray)
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 40)
            .background(.white)
            .cornerRadius(20)
            .padding()
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
    }
}
