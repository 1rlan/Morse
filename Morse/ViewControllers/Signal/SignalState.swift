// Irlan Abushakhmanov, 2023

import SwiftUI

import AVFoundation
import CoreHaptics

typealias TranslateAction = () -> Void

enum SignalState: String, CaseIterable {
    case flash
    case sound
    case vibration
    
    var image: Image {
        Image(systemName: imageName)
    }
    
    func translateString(stringToTranslate: String) -> TranslateAction {
        switch self {
        case .flash:
            return flashing(stringToTranslate: stringToTranslate)
        case .sound:
            return sounding(stringToTranslate: stringToTranslate)
        case .vibration:
            return vibration(stringToTranslate: stringToTranslate)
        }
    }
    
    private func flashing(stringToTranslate: String) -> TranslateAction {
        if let device = AVCaptureDevice.default(for: AVMediaType.video), device.hasTorch {
            return {
                stringToTranslate.forEach { morseSymbol in
                    switch morseSymbol {
                    case ".":
                        flashON(tick: .short)
                        sleep(tick: .pause)
                    case "-":
                        flashON(tick: .long)
                        sleep(tick: .pause)
                    default:
                        sleep(tick: .pause)
                        sleep(tick: .pause)
                    }
                }
            }
        } else {
            return {
                print("No torch on device")
            }
        }
    }
    
    
    private func flashON(tick: Tick) {
        flashLightOn(mode: .on)
        sleep(tick: tick)
        flashLightOn(mode: .off)
    }
    
    private func flashLightOn(mode: AVCaptureDevice.TorchMode) {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            try device?.lockForConfiguration()
            device?.torchMode = mode
            device?.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
    
    private func sounding(stringToTranslate: String) -> TranslateAction {
        return {
            stringToTranslate.forEach { morseSymbol in
                switch morseSymbol {
                case ".":
                    TranslationPlayer.play(tick: .short)
                    sleep(tick: .pause)
                case "-":
                    TranslationPlayer.play(tick: .long)
                    sleep(tick: .pause)
                default:
                    sleep(tick: .pause)
                }
            }
        }
    }
    
    private func vibration(stringToTranslate: String) -> TranslateAction {
        return {
            stringToTranslate.forEach {  morseSymbol in
                switch morseSymbol {
                case ".":
                    AudioServicesPlaySystemSound(1519)
                    sleep(tick: .pause)
                case "-":
                    AudioServicesPlaySystemSound(1521)
                    sleep(tick: .longPause)
                default:
                    sleep(tick: .pause)
                }
                
            }
        }
    }
    
    private func sleep(tick: Tick) {
        Thread.sleep(forTimeInterval: tick.duration)
    }
    
    
    private var imageName: String {
        switch self {
        case .flash:
            return "flashlight.on.fill"
        case .sound:
            return "headphones"
        case .vibration:
            return "iphone.radiowaves.left.and.right"
        }
    }
}
