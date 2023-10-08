import SwiftUI

class GroceriesViewModel: ObservableObject {
    @Published var groceriesCount: Int?
    
    @MainActor
    func getCount() async {
        groceriesCount = nil
        do {
            if let newCount = try await Supabase
                .from(.groceries)
                .select(count: .exact)
                .execute()
                .count {
                groceriesCount = newCount
                return
            }
        } catch {}
        groceriesCount = -1
    }
}
