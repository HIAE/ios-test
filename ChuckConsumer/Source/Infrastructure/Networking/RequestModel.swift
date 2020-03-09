import Foundation

public protocol RequestModel {
    var url: String { get }
    var method: HttpMethod { get }
    var body: HttpBody? { get }
    var headers: HttpHeaders { get set }
    var timeout: TimeInterval { get }
}

extension RequestModel {
    public var timeout: TimeInterval { return TimeInterval(30) }
}
