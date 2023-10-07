import Foundation

class IWIPSettings {
    static let shared = IWIPSettings()
    var apiKey: String = "nil"
    var apiURL: String = "nil"
    var hasApiData = false
    
    init() {
        getApiData()
    }
    
    private func getApiData() {
        if let apiDataPath = Bundle.main.path(forResource: "ApiAccessInfo", ofType: "plist") {
            if let apiData = NSDictionary(contentsOfFile: apiDataPath) as? [String: String] {
                if let key = apiData["DatabankKey"], let url = apiData["DatabankURL"] {
                    apiKey = key
                    apiURL = url
                    hasApiData = true
                }
            }
        }
    }
}
