import SwiftUI

struct MainScreen: View {
    @StateObject var mainVM = MainViewModel()
    
    var body: some View {
        ZStack() {
            switch (mainVM.status) {
            case .loading:
                LoadingCircle().task {
                    await mainVM.initApp()
                }
            case .failure:
                Text("Something went wrong, restart the app.")
            case .login:
                LoginScreen().environmentObject(mainVM)
            case .authorized:
                DashboardScreen().environmentObject(mainVM)
            }
        }.maxSize().padding(20)
    }
}

#Preview {
    MainScreen()
}
