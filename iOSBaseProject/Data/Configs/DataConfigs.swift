import Foundation

class DataConfigs {

    private init() {}

    enum Environment {
        case debug
        case release
    }

    static var environment: Environment {
        #if RELEASE
        return .release
        #else
        return .debug
        #endif
    }

    static var baseURL: String {
        switch environment {
        case .debug:
            return ""
        case .release:
            return ""
        }
    }

    static let appPrefix = Bundle.main.bundleIdentifier ?? "iOSBaseProject" // TODO: Update here
}
