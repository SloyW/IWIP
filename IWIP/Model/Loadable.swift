import SwiftUI

class Loadable: ObservableObject {
    @Published var loadingState: LoadingState = .Loading
    
    func resolveWithState(block: () async throws -> ()) async {
        do {
            try await block()
            await MainActor.run {
                loadingState = .Loaded
            }
        } catch {
            error.log()
            let errorKey = error.apiType().key()
            await MainActor.run {
                loadingState = .Error(errorKey: errorKey)
            }
        }
    }
    
    func resolveWithoutState(block: () async throws -> ()) async {
        do {
            try await block()
            await MainActor.run {
                loadingState = .Loaded
            }
        } catch {
            error.log()
            let errorKey = error.apiType().key()
            await MainActor.run {
                loadingState = .Error(errorKey: errorKey)
            }
        }
    }
}
