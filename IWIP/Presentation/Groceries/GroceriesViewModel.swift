import SwiftUI

class GroceriesViewModel: Loadable {
    @Published var groceriesCount: Int?
    @Published var groceries: [GroceryModel] = []
    
    func getCount() async {
        await updateCount(nil)
        do {
            if let newCount = try await Supabase
                .from(.groceries)
                .select(columns: "*", head: true, count: .exact)
                .execute()
                .count {
                await updateCount(newCount)
                return
            }
        } catch {
            error.log()
        }
        await updateCount(-1)
    }
    
    func getGroceries() async {
        await updateGroceries([])
        await resolveWithState {
            if let newGroceries: [GroceryModel] = await executeQuery(Supabase.from(.groceries)
                .select()
            ) {
                await updateGroceries(newGroceries)
            }
        }
    }
    
    func deleteGrocery(id: Int) async {
        await resolveWithoutState {
            try await Supabase.from(.groceries).delete().eq(column: "id", value: id).execute()
            
            var newGroceries = groceries
            newGroceries.removeAll(where: { grocery in
                return grocery.id == id
            })
            
            await updateGroceries(newGroceries)
        }
    }
    
    @MainActor
    private func updateCount(_ count: Int?) {
        groceriesCount = count
    }
    
    @MainActor
    private func updateGroceries(_ newGroceries: [GroceryModel]) {
        if newGroceries.isEmpty {
            loadingState = .Empty
        }
        groceries = newGroceries
    }
}
