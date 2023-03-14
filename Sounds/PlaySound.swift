// Irlan Abushakhmanov, 2023

import Foundation

import AVFoundation

struct PlaySound {
    static var player: AVAudioPlayer!
    
    static func play(tick: Tick) {
        if let url = Bundle.main.url(forResource: tick.rawValue, withExtension: "mp3") {
            do {
                player = try? AVAudioPlayer(contentsOf: url)
                player?.play()
            }
        }
    }
}


