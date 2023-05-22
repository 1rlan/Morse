//
//  CartFront.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import SwiftUI

struct CardFront : View {
    let application = UIApplication.shared
    
    let height : CGFloat
    @Binding var degree: Double
    let cardText: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(height: height)
                .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
            Text(cardText).font(.system(size: 64))
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CartFront_Previews: PreviewProvider {
    static var previews: some View {
        CardFront(height: 400, degree: .constant(0), cardText: "L")
    }
}

