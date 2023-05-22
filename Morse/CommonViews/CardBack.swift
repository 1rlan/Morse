//
//  CardBack.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import SwiftUI

struct CardBack : View {
    let application = UIApplication.shared
    
    let height : CGFloat
    @Binding var degree : Double
    var cardText: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(application.leadingColor)
                .frame(height: height)
                .overlay(RoundedRectangle(cornerRadius: 22)
                    .stroke(lineWidth: 1))
            Text(cardText).font(.system(size: 64))
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack_Previews: PreviewProvider {
    static var previews: some View {
        CardBack(height: 400, degree: .constant(0), cardText: "••---•••")
    }
}
