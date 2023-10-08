import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var mainVM: MainViewModel
    @StateObject var loginVM = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            LogoView().padding(.bottom, 10)
            Text("please_login").fontSize(20)
            TextField(text: $loginVM.email, prompt: Text("email")) {}
                .autocorrectionDisabled()
                .foregroundColor(.accentColor())
                .roundedBackgroud()
            SecureField(text: $loginVM.password, prompt: Text("password")) {}
                .foregroundColor(.accentColor())
                .roundedBackgroud()
            Button(action : {
                loginVM.status = .loggingIn
            } ) {
                Text("login")
                    .fontSize(20, .bold)
                    .foregroundColor(.fontColor())
            }
            .roundedBackgroud(.accentColor())
            .disabled(loginVM.status == .loggingIn)
            .task(id: "\(loginVM.status)") {
                if loginVM.status == .loggingIn {
                    await loginVM.login()
                }
                if loginVM.status == .loggedIn {
                    mainVM.email = loginVM.email.lowercased()
                    mainVM.password = loginVM.password
                    mainVM.status = .authorized
                }
            }
            if loginVM.status == .logInFailure {
                Text("login_failure")
            }
            if loginVM.status == .loggingIn {
                LoadingCircle().frame(width: 50, height: 50)
            }
            
            Spacer()
        }.maxSize()
    }
}
