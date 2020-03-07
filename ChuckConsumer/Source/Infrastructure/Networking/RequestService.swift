public protocol RequestService {

    func requestData(from request: StandardRequest,
                     additionalHeaders: HttpHeaders,
                     completion: HttpCompletion?)

    func request<T: Decodable>(_ type: T.Type,
                               from request: StandardRequest,
                               additionalHeaders: HttpHeaders,
                               completion: ((Result<T, Error>) -> Void)?)

}
