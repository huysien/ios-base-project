import Foundation
import Moya

struct Errors {

    struct Code {
        static let unknown = -1
    }

    static var domain = DataConfigs.appPrefix + ".ErrorDomain"

    static var unknownError: NSError {
        NSError(
            domain: domain,
            code: Code.unknown,
            userInfo: [NSLocalizedDescriptionKey: L10n.Error.unknown]
        )
    }

    static func mapError(_ error: Error) -> Error {
        return error
    }
}
