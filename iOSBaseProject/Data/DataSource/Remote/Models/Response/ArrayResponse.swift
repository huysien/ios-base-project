import ObjectMapper
import SwiftyJSON

class ArrayResponse<T: Mappable>: BaseResponse {

    var data: [T] = []

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["data"]
    }
}
