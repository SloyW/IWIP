import SwiftUI

struct LoadingCircle: View {
    var color: Color = .accentColor()
    var lineWidth: CGFloat = 10
    @State var rotating = true
    @State var animationStart = true
    @State var animationEnd = true
    
    var body: some View {
        Circle()
            .trim(from: animationStart ? 1/3 : 1/9, to: animationEnd ? 2/5 : 1)
            .stroke(lineWidth: lineWidth)
            .rotationEffect(.degrees(rotating ? 360 : 0))
            .scaledToFit()
            .foregroundColor(color)
            .onAppear() {
                withAnimation(Animation
                    .linear(duration: 1)
                    .repeatForever(autoreverses: false)) {
                        rotating.toggle()
                    }
                withAnimation(Animation
                    .linear(duration: 1)
                    .delay(0.5)
                    .repeatForever(autoreverses: true)) {
                        animationStart.toggle()
                    }
                withAnimation(Animation
                    .linear(duration: 1)
                    .delay(1)
                    .repeatForever(autoreverses: true)) {
                        animationEnd.toggle()
                    }
            }.scaledToFit()
    }
}
