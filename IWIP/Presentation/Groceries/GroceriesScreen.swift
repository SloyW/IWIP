import SwiftUI

struct GroceriesScreen: View {
    @StateObject var groceriesVM = GroceriesViewModel()
    
    var body: some View {
        VStack() {
            HStack() {
                SystemImage(key: "groceries").scaledToFit().foregroundColor(.primary())
                Text("groceries").fontSize(50, .bold).foregroundColor(.primary())
                Spacer()
            }.frame(maxHeight: 50)
            LoadingWrapper(loadingStates: groceriesVM.loadingState) {
                ScrollView(showsIndicators: false) {
                    ForEach(0..<groceriesVM.groceries.endIndex, id: \.self) { index in
                        GroceryItem(grocery: groceriesVM.groceries[index])
                    }
                }
            }
            .environmentObject(groceriesVM)
            .task {
                await groceriesVM.getGroceries()
            }
            .refreshable {
                await groceriesVM.getGroceries()
            }
            Spacer()
        }.maxSize()
    }
}
