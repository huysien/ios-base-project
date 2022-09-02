import Foundation
import Moya

enum API {

    case test(id: Int64, text: String)
    case uploadFile(data: Data)
}

extension API: TargetType {

    var baseURL: URL {
        return URL(string: DataConfigs.baseURL)!
    }

    var path: String {
        switch self {
        case .test(let id, _):
            return "/api/test/\(id)"
        case .uploadFile:
            return "/api/static/upload"
        }
    }

    var method: Moya.Method {
        switch self {
        case .test:
            return .get
        case .uploadFile:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .uploadFile(let data):
            return .uploadMultipart([MultipartFormData(provider: .data(data), name: "file")])
        default:
            return .requestParameters(
                parameters: parameters,
                encoding: method == .post || method == .put ? JSONEncoding.prettyPrinted : URLEncoding.queryString
            )
        }
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    var parameters: [String: Any] {
        switch self {
        case .test(_, let text):
            return ["text": text]
        case .uploadFile:
            return [:]
        }
    }

    var validationType: ValidationType {
        .successCodes
    }
}

extension API: AccessTokenAuthorizable {

    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .bearer
        }
    }
}
