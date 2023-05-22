//
//  SignalButtonImageView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 14.05.2023.
//

import SwiftUI

struct SignalButtonImageView: View {
    private let application = UIApplication.shared
    let image: Image
    
    var body: some View {
        image
            .foregroundColor(application.leadingColor)
            .font(.system(size: 20))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1.0, contentMode: .fit)
            .overlay {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(application.leadingColor, lineWidth: 1)
            }
    }
}

struct SignalButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        SignalButtonImageView(image: SignalState.flash.image)
    }
}
