class ApiError: Error {
    var type: ApiErrorType
    
    init(type: ApiErrorType) {
        self.type = type
    }
    
    func key() -> String {
        switch type {
        case .Timeout:
            return "error_timeout"
        case .NoResult:
            return "error_no_result"
        case .ConnectionError:
            return "error_connection"
        default:
            return "error_unknown"
        }
    }
    
    enum ApiErrorType {
        case Timeout
        case NoResult
        case ConnectionError
        case Unknown(error: Error)
    }
}
