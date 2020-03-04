import Foundation

public protocol RequestProtocol {
    var url: String { get }
    var method: HTTPMethod { get }
    var body: HTTPBody? { get }
    var headers: HTTPHeaders { get set }
    var timeout: TimeInterval { get }
}

extension RequestProtocol {
    public var timeout: TimeInterval { return TimeInterval(30) }
}
