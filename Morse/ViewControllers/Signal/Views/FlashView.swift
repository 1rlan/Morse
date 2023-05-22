//
//  FlashView.swift
//  course work
//
//  Created by Ирлан Абушахманов on 16.05.2023.
//

import SwiftUI

struct FlashView: View, Popable {
    @Environment (\.dismiss) var dismiss
    @ObservedObject var barStates: BarsStates
    var ticks: Ticks
    @State private var originalBrightness: CGFloat = UIScreen.main.brightness
    @State private var changingColor = Color(.systemGray6)
    @State private var startFlash = false
    
    let application = UIApplication.shared
    
    var body: some View {
        ZStack {
            changingColor
            if (!startFlash) {
                Button("Start translation") {
                    startFlashing()
                    startFlash = true
                }.frame(width: 200, height: 80)
                .foregroundColor(application.leadingColor)
                .font(.system(size: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(application.leadingColor, lineWidth: 1)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
    }
    
    private func startFlashing() {
        startFlash = false
        setMaxBrightness()
        flashing()
    }
    
    private func flashing() {
        guard let tick = ticks.ticks.first else {
            resetBrightness()
            barStates.activate()
            popView()
            return
        }
        
        self.changingColor = tick.color
        
        DispatchQueue.main.asyncAfter(deadline: .now() + tick.duration) {
            self.changingColor = .black
            DispatchQueue.main.asyncAfter(deadline: .now() + Tick.short.duration) {
                self.ticks.ticks.removeFirst()
                self.flashing()
            }
        }
    }

    
    private func setMaxBrightness() {
        originalBrightness = UIScreen.main.brightness
        UIScreen.main.brightness = 1.0
    }
        
    private func resetBrightness() {
        UIScreen.main.brightness = originalBrightness
    }
    
    func popView() {
        barStates.activate()
        dismiss()
    }
}

struct FlashView_Previews: PreviewProvider {
    static var previews: some View {
        FlashView(barStates: .init(), ticks: Ticks(ticks: [.long, .long, .pause]))
    }
}
