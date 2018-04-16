import Foundation


// There isn't a mutable HTTPURLResponse, so we have to make our own.
class HTTPURLResponse {

    // MARK: - Properties

    var url: URL = URL(string: "http://google.com")!
    var statusCode: Int = 0
    var allHeaderFields: [String: String] = [:]

    var foundationResponse: Foundation.HTTPURLResponse {
        return Foundation.HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: allHeaderFields)!
    }
}


extension HTTPURLResponse {
    convenience init(dictionary: [String: Any]) {
        self.init()
        url = URL(string: dictionary["url"] as! String)!

        if let headers = dictionary["headers"] as? [String: String] {
            allHeaderFields = headers
        }

        if let status = dictionary["status"] as? Int {
            statusCode = status
        }
    }
}
