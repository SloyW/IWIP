import SwiftUI

class MainViewModel: ObservableObject {
    @Published var status: MainStatus = .loading
    @AppStorage("api-username") var email: String?
    @AppStorage("api-password") var password: String?
    @Published var user: UserModel?
    
    @MainActor
    func initApp() async {
        if IWIPSettings.shared.hasApiData {
            await logIn()
        } else {
            status = .failure
        }
    }
    
    @MainActor
    func logIn() async {
        if let email = email, let password = password {
            do {
                try await Supabase.client.auth.signIn(email: email, password: password)
                status = .authorized
                return
            } catch {}
        }
        status = .login
    }
    
    func logOut() {
        status = .loading
        email = nil
        password = nil
        user = nil
        Task {
            await signOut()
        }
    }
    
    @MainActor
    private func signOut() async {
        do {
            try await Supabase.client.auth.signOut()
        } catch {}
        status = .login
    }
    
    @MainActor
    func getUser() async {
        if let email = email {
            if let newUser: UserModel = await executeQuery(Supabase.from(.user)
                .select()
                .eq(column: "email", value: email)
                .single()
            ) {
                user = newUser
            }
        }
    }
    
    enum MainStatus {
        case loading
        case failure
        case login
        case authorized
    }
}
