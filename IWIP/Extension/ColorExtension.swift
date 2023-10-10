import SwiftUI

extension Color {
    
    static func primary() -> Color {
        Color("MainColor", bundle: Bundle.main)
    }
    static func accentColor() -> Color {
        Color("AccentColor", bundle: Bundle.main)
    }
    static func fontColor() -> Color {
        Color("FontColor", bundle: Bundle.main)
    }
    static func backgroundColor() -> Color {
        Color("BackgroundColor", bundle: Bundle.main)
    }
    static func negativeColor() -> Color {
        Color("NegativeColor", bundle: Bundle.main)
    }
}
