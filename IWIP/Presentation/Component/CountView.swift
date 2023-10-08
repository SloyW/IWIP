import SwiftUI

struct CountView: View {
    var count: Int?
    var fontSize: CGFloat = 14
    
    var body: some View {
        ZStack() {
            Circle().foregroundColor(.fontColor()).scaledToFit()
            if let count = count {
                if count < 100 {
                    if count >= 0 {
                        Text("\(count)").fontSize(fontSize, .bold).foregroundColor(.primary())
                    } else {
                        Text("?").fontSize(fontSize, .bold).foregroundColor(.primary())
                    }
                } else {
                    Text("+99").fontSize(fontSize, .bold).foregroundColor(.primary())
                }
            } else {
                LoadingCircle(color: .primary(), lineWidth: 5).scaledToFit().padding(5)
            }
        }
    }
}
