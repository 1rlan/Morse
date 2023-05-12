import Foundation

public enum TabBarState: String, CaseIterable {
    case signal = "sun.max"
    case translate = "doc.plaintext"
    case training = "book"
    case settings = "gearshape"
    
    
    public var tabString: String {
        switch self {
        case .signal:
            return "Conversion"
        case .translate:
            return "Translation"
        case .training:
            return "Training"
        case .settings:
            return "Settings"
        }
    }
}
