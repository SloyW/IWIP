import SwiftUI

struct GroceriesWidget: View {
    @StateObject var groceriesVM = GroceriesViewModel()
    
    var body: some View {
        NavigationLink(value: Route.groceries) {
            HStack(spacing: 10) {
                SystemImage(key: "groceries")
                    .foregroundColor(.fontColor())
                    .scaledToFit()
                    .frame(maxWidth: 35, maxHeight: 35)
                Text("groceries").foregroundColor(.fontColor())
                Spacer()
                CountView(count: groceriesVM.groceriesCount).frame(maxWidth: 35, maxHeight: 35)
            }.maxSize(.horizontal).roundedBackgroud(.accentColor(), internalPadding: 20).task {
                await groceriesVM.getCount()
            }
        }
    }
}
