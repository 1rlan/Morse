//
//  SignalButtonNavigationLink.swift
//  course work
//
//  Created by Ирлан Абушахманов on 17.05.2023.
//

import SwiftUI

struct SignalButtonNavigationLink: View {
    @ObservedObject var barStates: BarsStates
    var ticks: Ticks
    private let application = UIApplication.shared

    var body: some View {
        NavigationLink(
            destination: FlashView(barStates: barStates, ticks: ticks),
            label: {
                SignalButtonImageView(image: SignalState.flash.image)
            }
        )
        .simultaneousGesture(TapGesture().onEnded {
            barStates.deactivate()
        })
        
    }
}

struct SignalButtonNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        SignalButtonNavigationLink(barStates: .init(), ticks: .init(ticks: []))
    }
}

