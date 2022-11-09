import Foundation

extension JSONDecoder {
    
    static var `default`: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }
    
    func decode<T: Decodable>(_ type: T.Type, fromJSON json: [String: Any]) -> T? {
        do {
            let data = try JSONSerialization.data(withJSONObject: json)
            let object = try decode(type, from: data)
            return object
        } catch {
            return nil
        }
    }
}

extension JSONEncoder {
    
    static var `default`: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .millisecondsSince1970
        return encoder
    }
    
    func encodeToJSON<T: Encodable>(_ value: T) -> [String: Any] {
        do {
            let jsonData = try JSONEncoder.default.encode(value)
            return (try JSONSerialization.jsonObject(with: jsonData)) as? [String: Any] ?? [:]
        } catch {
            return [:]
        }
    }
}
