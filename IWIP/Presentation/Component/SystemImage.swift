import SwiftUI

struct SystemImage: View {
    var key: String
    
    var body: some View {
        Image(systemName: getSystemName()).resizable()
    }
    
    private func getSystemName() -> String {
        switch key {
        case "account":
            return "person.crop.circle"
        case "cancel":
            return "x.circle"
        case "groceries":
            return "cart"
        default:
            return "cart"
        }
    }
}
