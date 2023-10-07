import SwiftUI

extension View {
    func maxSize(_ direction: ViewMaxSizeDirection = .all) -> some View {
        switch direction {
        case .all:
            return self.frame(maxWidth: .infinity, maxHeight: .infinity)
        case .horizontal:
            return self.frame(maxWidth: .infinity)
        case .vertical:
            return self.frame(maxHeight: .infinity)
        }
    }
    
    func roundedBackgroud(_ backgroundColor: Color = .backgroundColor(),
                          internalPadding: CGFloat = 10,
                          cornerRadius: CGFloat = 10) -> some View {
        let view = ZStack() {
            self.padding(internalPadding)
        }.background(RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(backgroundColor))
        return view
    }
        
}

enum ViewMaxSizeDirection {
    case all
    case horizontal
    case vertical
}
