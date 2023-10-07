import SwiftUI

struct LogoView: View {
    var fontSize: CGFloat = 70
    var fontColor: Color = Color.primary()
    
    var body: some View {
        Text("IWIP").font(.system(size: fontSize).bold()).foregroundColor(fontColor)
    }
}
