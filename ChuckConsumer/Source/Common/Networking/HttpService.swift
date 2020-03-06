import Foundation

public typealias HttpResult = Result<Data, Error>
public typealias HttpCompletion = (HttpResult) -> Void

public protocol HttpService {

    func request(_ req: RequestProtocol,
                 additionalHeaders: HttpHeaders,
                 completion: ((Result<Data, Error>) -> Void)?)

}
