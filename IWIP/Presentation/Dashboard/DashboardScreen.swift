import SwiftUI

struct DashboardScreen: View {
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View {
        switch (mainVM.user != nil) {
        case true:
            VStack() {
                HStack() {
                    if let username = mainVM.user?.username {
                        Text(username).fontSize(50).foregroundColor(.fontColor())
                    }
                    Spacer()
                    Button(action: { mainVM.logOut() }) {
                        ZStack() {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.fontColor())
                            Image(systemName: "x.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.negativeColor()).opacity(0.5)
                        }.frame(maxWidth: 35, maxHeight: 35)
                    }.roundedBackgroud(.negativeColor())
                }.maxSize(.horizontal)
                GroceriesWidget()
                Spacer()
            }.maxSize()
        case false:
            HStack(spacing: 10) {
                Text("getting_user").fontSize(35).foregroundColor(.fontColor())
                LoadingCircle().frame(width: 35, height: 35)
            }.task {
                await mainVM.getUser()
            }
        }
    }
}
