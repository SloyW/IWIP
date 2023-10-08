import SwiftUI

struct IWIPNavigation: View {
    
    var body: some View {
        NavigationStack() {
            DashboardScreen().navigationDestination(for: Route.self) { route in
                switch (route) {
                case .groceries:
                    GroceriesScreen()
                }
            }
        }
    }
}
