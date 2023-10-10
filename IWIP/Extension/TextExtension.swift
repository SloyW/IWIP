import SwiftUI

extension Text {
    
    func fontSize(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Text {
        return self.font(.system(size: size, weight: weight))
    }
}
