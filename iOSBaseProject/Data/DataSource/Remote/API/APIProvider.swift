import Foundation
import Moya

class APIProviderFactory {
    
    func makeAPIProvider() -> APIProvider {
        APIProviderImpl()
    }
}

protocol APIProvider {
    
    func getProvider() -> MoyaProvider<API>
}

private class APIProviderImpl {
    
    private let appUserDefaults: AppUserDefaults = AppUserDefaultsFactory().makeAppUserDefaults()
    
    private let jsonFormatter: (Data) -> String = { data in
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
        } catch {
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
}

extension APIProviderImpl: APIProvider {
    
    func getProvider() -> MoyaProvider<API> {
        var plugins: [PluginType] = [
            NetworkLoggerPlugin(
                configuration: .init(
                    formatter: .init(responseData: jsonFormatter),
                    logOptions: .verbose
                )
            )
        ]
        if let accessToken = appUserDefaults.accessToken {
            plugins.append(AccessTokenPlugin(tokenClosure: { _ in accessToken }))
        }
        return MoyaProvider<API>(plugins: plugins)
    }
}
