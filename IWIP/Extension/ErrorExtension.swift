import Foundation

extension Error {
    
    // TODO: replace with proper logging
    func log() {
        print(self.message())
    }
    
    func message() -> String {
        let nsError = self as NSError
        guard let description = nsError.localizedDescription as String? else {
            let description = "no description"
        }
        return "\(nsError.domain) \(nsError.code): \(description)"
    }
    
    func apiType() -> ApiError {
        let nsError = self as NSError
        switch nsError.code {
        case 100:
            return ApiError(type: .ConnectionError)
        case 101 | 120 | 141:
            return ApiError(type: .NoResult)
        case 124:
            return ApiError(type: .Timeout)
        default:
            return ApiError(type: .Unknown(error: self))
        }
    }
}
