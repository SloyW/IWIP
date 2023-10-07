import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var status: LoginStatus = .loggedOut
    var email = ""
    var password = ""
    
    @MainActor
    func login() async {
        do {
            try await Supabase.client.auth.signIn(email: email, password: password)
            status = .loggedIn
        } catch {
            status = .logInFailure
        }
    }
    
    enum LoginStatus {
        case loggedOut
        case loggingIn
        case logInFailure
        case loggedIn
    }
}
