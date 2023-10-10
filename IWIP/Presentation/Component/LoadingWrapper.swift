import SwiftUI

struct LoadingWrapper<Content>: View where Content: View {
    @Environment(\.refresh) private var refresh
    var loadingStates: [LoadingState]
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        switch getStatus(loadingStates: loadingStates) {
        case .Loading:
            HStack() {
                Spacer()
                VStack() {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                Spacer()
            }
        case .Empty:
            Text("no_results")
        case .Error(let errorKey):
            HStack() {
                Spacer()
                VStack() {
                    Spacer()
                    Text(LocalizedStringKey(errorKey))
                    if let refresh = refresh {
                        Button(action: {
                            Task {
                                await refresh()
                            }
                        }) {
                            Text("try_again")
                        }.roundedBackgroud(.accentColor())
                    }
                    Spacer()
                }
                Spacer()
            }
        default:
            content()
        }
    }
    
    func getStatus(loadingStates: [LoadingState]) -> LoadingState {
        for loadingState in loadingStates {
            switch loadingState {
            case .Error(let errorKey):
                return .Error(errorKey: errorKey)
            case .Loading:
                return .Loading
            default:
                break
            }
        }
        
        return .Loaded
    }
}


extension LoadingWrapper {
    init(
        loadingStates: LoadingState...,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.init(loadingStates: loadingStates, content: content)
    }
}
