public protocol RequestService {

    func requestData(from request: RequestProtocol,
                     additionalHeaders: HttpHeaders,
                     completion: HttpCompletion?)

    func request<T: Decodable>(_ type: T.Type,
                               from request: RequestProtocol,
                               additionalHeaders: HttpHeaders,
                               completion: ((Result<T, Error>) -> Void)?)

}
