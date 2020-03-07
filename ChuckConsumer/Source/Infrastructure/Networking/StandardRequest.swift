import Foundation

public typealias HttpHeaders = [String: String]
public typealias HttpParameters = [String: Any]
public typealias HttpBody = Data

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public protocol StandardRequest {
    var url: String { get }
    var method: HttpMethod { get }
    var body: HttpBody? { get }
    var headers: HttpHeaders { get set }
    var timeout: TimeInterval { get }
}

extension StandardRequest {
    public var timeout: TimeInterval { return TimeInterval(30) }
}
