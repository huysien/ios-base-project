import Foundation
import Moya
import SwiftyJSON

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
        if let moyaError = error as? MoyaError,
           case .underlying( _, let response) = moyaError,
           let response = response,
           let jsonDict = try? response.mapJSON(),
           let dict = JSON(jsonDict).dictionaryObject,
           let baseResponse = BaseResponse(JSON: dict),
           let code = baseResponse.code,
           let message = baseResponse.message {
            return NSError(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey: message])
        }
        return unknownError
    }
}
