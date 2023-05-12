// Irlan Abushakhmanov, 2023

import SwiftUI

struct TrainingViewController: View {
    @Binding var tabbarActive: Bool
    
    let application = UIApplication.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 14) {
                ForEach(TrainState.allCases, id: \.rawValue) { state in
                    TrainButton(state: state, tabbarActive: $tabbarActive)
                }
                Spacer()
            }.padding(.top, 2)
        }
    }
}

struct TrainingViewController_Previews: PreviewProvider {
    static var previews: some View {
        TrainingViewController(tabbarActive: .constant(true))
    }
}
