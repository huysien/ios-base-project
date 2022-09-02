import ObjectMapper
import SwiftyJSON

struct APIMapper {

    static func mapArray<T: Mappable>(from json: JSON) throws -> [T] {
        if let dict = json.dictionaryObject,
           let response = ArrayResponse<T>(JSON: dict) {
            return response.data
        }
        throw Errors.unknownError
    }

    static func mapObject<T: Mappable>(from json: JSON) throws -> T {
        if let dict = json.dictionaryObject,
           let response = ObjectResponse<T>(JSON: dict),
           let data = response.data {
            return data
        }
        throw Errors.unknownError
    }
}
