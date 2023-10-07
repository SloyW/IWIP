import Supabase
import Foundation

class Supabase {
    static let client = SupabaseClient(supabaseURL: URL(string: IWIPSettings.shared.apiURL)!, supabaseKey: IWIPSettings.shared.apiKey)
    
    static func from(_ table: TableModel) -> PostgrestQueryBuilder {
        return Supabase.client.database.from(table.rawValue)
    }
}

func executeQuery<T: Decodable>(_ query: PostgrestTransformBuilder) async -> T? {
    do {
        let response: PostgrestResponse<T> = try await query.execute()
        return response.value
    } catch {
        print(error)
    }
    return nil
}

func executeQuery<T: Decodable>(_ query: PostgrestFilterBuilder) async -> T? {
    do {
        let response: PostgrestResponse<T> = try await query.execute()
        return response.value
    } catch {
        print(error)
    }
    return nil
}
