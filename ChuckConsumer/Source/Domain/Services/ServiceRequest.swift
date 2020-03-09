import Foundation

struct ServiceRequest: RequestModel {
    var url: String = ""
    var method: HttpMethod = .get
    var body: HttpBody?
    var headers: HttpHeaders = [:]
}
