import SwiftUI

struct GroceriesScreen: View {
    var body: some View {
        VStack() {
            HStack() {
                Image(systemName: "cart").resizable().scaledToFit().foregroundColor(.primary())
                Text("groceries").fontSize(50, .bold).foregroundColor(.primary())
                Spacer()
            }.frame(maxHeight: 50)
            Spacer()
        }.maxSize()
    }
}
