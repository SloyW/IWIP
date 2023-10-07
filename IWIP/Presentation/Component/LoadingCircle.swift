import SwiftUI

struct LoadingCircle: View {
    var width: CGFloat = 30
    var height: CGFloat = 30
    
    var body: some View {
        ZStack() {
            ProgressView().scaledToFit().foregroundColor(.accentColor())
        }.frame(maxWidth: width ,maxHeight: height)
    }
}
