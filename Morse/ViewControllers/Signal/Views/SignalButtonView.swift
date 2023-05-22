// Irlan Abushakhmanov, 2023

import SwiftUI

struct SignalButtonView: View {
    private let application = UIApplication.shared
    
    let state: SignalState
    @Binding var inputString: String
    
    var body: some View {
        Button(action: {
            tapClousreDetachedCall()
        }) {
            SignalButtonImageView(image: state.image)
        }
        
    }
    
    func tapClousreDetachedCall() {
        Task.detached {
            state.translateString(stringToTranslate: inputString)()
        }
    }
}

struct SignalButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignalButtonView(state: .flash, inputString: .constant("Placeholder"))
    }
}

