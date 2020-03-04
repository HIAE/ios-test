import Foundation

public protocol RequestProtocol {
    var url: String { get }
    var method: Networking.Method { get }
    var body: Networking.HTTPBody? { get }
    var headers: Networking.Headers { get set }
    var timeout: TimeInterval { get }
}

extension RequestProtocol {
    public var timeout: TimeInterval { return TimeInterval(30) }
}
