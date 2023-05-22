//
//  CardView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import SwiftUI

struct CardView: View, Popable {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var barStates: BarsStates
    @StateObject var models = CardModel()
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    
    let height : CGFloat = 200
    let durationAndDelay : CGFloat = 0.3
    
    //MARK: View Body
    var body: some View {
        VStack {
            CommonStatusBarView(title: .constant("Card"), backButtonAction: popView)
            if let model = models.model {
                ZStack {
                    CardFront(height: height, degree: $frontDegree, cardText: model.symbol)
                    CardBack(height: height, degree: $backDegree, cardText: model.morse)
                }.onTapGesture {
                    flipCard()
                }.padding(.horizontal, 26)
                Spacer()
                HStack {
                    CardButton(cardState: .dontKnow, onTapClousre: dontKnowTap, buttonDisabled: .constant(false))
                    CardButton(cardState: .know, onTapClousre: knowTap, buttonDisabled: .constant(false))
                }.padding(.horizontal, 16)
            } else {
                Spacer()
                Text("""
                    All letters learned 🥳,
                    you can reset your progress in the settings.
                    """).padding(.horizontal, 16)
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func knowTap() {
        models.removeElement()
        models.saveData()
        models.setRandomModel()
    }
    private func dontKnowTap() {
        models.setRandomModel()
    }

    func popView() {
        dismiss()
        barStates.activate()
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(barStates: .init())
    }
}

