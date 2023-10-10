import SwiftUI

struct GroceryItem: View {
    @EnvironmentObject var groceriesVM: GroceriesViewModel
    @State var grocery: GroceryModel
    @State private var confirmButton = false
    @State private var deleting = false
    
    var body: some View {
        VStack() {
            HStack() {
                SystemImage(key: grocery.category)
                    .foregroundColor(.fontColor())
                    .scaledToFit()
                    .frame(maxWidth: 35, maxHeight: 35)
                Text(grocery.name).fontSize(20).foregroundColor(.fontColor())
                Spacer()
                if deleting {
                    LoadingCircle(color: .negativeColor()).task {
                        await groceriesVM.deleteGrocery(id: grocery.id)
                    }
                } else {
                    Button(role: .destructive, action: { confirmButton = true }) {
                        SystemImage(key: "cancel")
                            .foregroundColor(.negativeColor())
                            .scaledToFit()
                            .frame(maxWidth: 35, maxHeight: 35)
                    }.confirmationDialog("delete_warning_grocery", isPresented: $confirmButton, titleVisibility: .visible) {
                        Button("delete_item", role: .destructive) {
                            deleting = true
                        }
                    }
                }
            }
        }.maxSize(.horizontal).roundedBackgroud(.accentColor())
    }
}
