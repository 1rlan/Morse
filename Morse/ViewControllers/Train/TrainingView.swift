// Irlan Abushakhmanov, 2023

import SwiftUI

struct TrainingView: View {
    @ObservedObject var barStates: BarsStates
    
    let application = UIApplication.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 14) {
                ForEach(TrainState.allCases, id: \.rawValue) { state in
                    TrainButtonView(barStates: barStates, state: state)
                }
                Spacer()
            }.padding(.top, 2)
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(barStates: .init())
    }
}
