import SwiftUI

struct MainScreen: View {
    @StateObject var mainVM = MainViewModel()
    
    var body: some View {
        ZStack() {
            switch (mainVM.status) {
            case .loading:
                LoadingCircle()
                    .frame(width: 35, height: 35)
                    .task {
                    await mainVM.initApp()
                }
            case .failure:
                Text("app_init_failed")
            case .login:
                LoginScreen().environmentObject(mainVM)
            case .authorized:
                IWIPNavigation().environmentObject(mainVM)
            }
        }.maxSize().padding(20)
    }
}

#Preview {
    MainScreen()
}
