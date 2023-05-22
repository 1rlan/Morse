// Irlan Abushakhmanov, 2023

import Foundation

import AVFoundation

struct TranslationPlayer {
    static var audioPlayer: AVAudioPlayer!
    
    static func play(tick: Tick) {
        if let url = Bundle.main.url(forResource: tick.rawValue, withExtension: "mp3") {
            do {
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        }
    }

    private func sleep(tick: Tick) {
        Thread.sleep(forTimeInterval: tick.duration)
    }
}


