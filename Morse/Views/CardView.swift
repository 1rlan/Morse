//
//  CardView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 02.05.2023.
//

import SwiftUI

struct CardView: View {
    
    init(tabbarActive: Binding<Bool>, state: TrainState) {
        self.state = state
        self._tabbarActive = tabbarActive
    }
    
    
    @Binding var tabbarActive: Bool
    @Environment(\.presentationMode) var presentationMode
    
    let state: TrainState
    var cardModels: [SymbolModel] = CustomUD.fetchData(keyState: .symbolCards) ?? []
    
    @ObservedObject var cardModel: SymbolModel = SymbolModel(symbol: "1", morse: "2")
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false

    let height : CGFloat = 200
    let durationAndDelay : CGFloat = 0.3

    //MARK: Flip Card Function
    func flipCard () {
        isFlipped.toggle()
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        VStack {
            ButtonTitle(tapAction: popView, title: state.rawValue)
            ZStack {
                CardFront(height: height, degree: $frontDegree, cardText: $cardModel.symbol)
                CardBack(height: height, degree: $backDegree, cardText: $cardModel.morse)
            }.onTapGesture {
                flipCard ()
            }.padding(.horizontal, 26)
            Spacer()
            HStack {
                CardButton(cardState: .dontKnow, onTapClousre: {})
                CardButton(cardState: .know, onTapClousre: {})
            }.padding(.horizontal, 16)
        }.onAppear {
            tabbarActive = false
        }.navigationBarBackButtonHidden(true)
    }
    
    func popView() {
        tabbarActive = true
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private mutating func knowTap() {
        if let positionToRemove = cardModels.firstIndex(where: { $0.morse == cardModel.morse }) {
            cardModels.remove(at: positionToRemove)
        }
    }
    
    private func dontKnowTap() {
        
    }
    
    private mutating func setRandomModel() {
        if let randomModel = cardModels.randomElement() {
            cardModel = randomModel
        } else {
            cardModel = SymbolModel(symbol: "", morse: "")
            assertionFailure("Эта функция должна быть переопределена в подклассе")
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(tabbarActive: .constant(false), state: .cards)
    }
}

