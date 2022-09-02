import ObjectMapper

class BaseResponse: Mappable {

    var status: String?
    var code: Int?
    var message: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        message <- map["message"]
    }
}
