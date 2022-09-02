import Foundation

protocol AppUserDefaults {

    var accessToken: String? { get }

    func setAccessToken(_ value: String?)
}

class AppUserDefaultsFactory {

    func makeAppUserDefaults() -> AppUserDefaults {
        AppUserDefaultsImpl()
    }
}

private class AppUserDefaultsImpl: AppUserDefaults {

    private var userDefaults: UserDefaults = .standard
    private let accessTokenKey = "AccessToken"

    var accessToken: String? {
        userDefaults.value(forKey: accessTokenKey) as? String
    }

    func setAccessToken(_ value: String?) {
        if value == nil {
            userDefaults.removeObject(forKey: accessTokenKey)
        } else {
            userDefaults.set(value, forKey: accessTokenKey)
            userDefaults.synchronize()
        }
        APIProvider.configure()
    }
}
