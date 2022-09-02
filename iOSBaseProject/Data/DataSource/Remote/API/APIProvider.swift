import Foundation
import Moya

struct APIProvider {

    static var provider: MoyaProvider<API> = createProvider()

    static func configure() {
        provider = createProvider()
    }

    private static func createProvider() -> MoyaProvider<API> {
        let appUserDefaults = AppUserDefaultsFactory().makeAppUserDefaults()
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(
                configuration: .init(
                    formatter: .init(responseData: JSONResponseDataFormatter),
                    logOptions: .verbose
                )
            ),
            AccessTokenPlugin(tokenClosure: { _ in appUserDefaults.accessToken ?? "" })
        ]
        return MoyaProvider<API>(plugins: plugins)
    }

    private static func JSONResponseDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
        } catch {
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
}
