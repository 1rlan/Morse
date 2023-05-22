//
//  TrainButtonView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 15.05.2023.
//

import SwiftUI

struct TrainButtonView: View {
    @ObservedObject var barStates: BarsStates
    let state: TrainState
    let application = UIApplication.shared
    
    var body: some View {
        NavigationLink(
            destination: AnyView(state.destination(barStates: barStates)),
            label: {
                HStack {
                    Text.halfTextLine(contentText: state.rawValue)
                }
                .padding()
                .frame(width: 340, height: 60)
                .overlay(RoundedRectangle(cornerRadius: 22).stroke(application.leadingColor, lineWidth: 1))
            }
        ).simultaneousGesture(TapGesture().onEnded {
            barStates.deactivate()
        })
    }
}

struct TrainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TrainButtonView(barStates: .init(), state: .cards)
    }
}
