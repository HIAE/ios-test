import Foundation

public class RawService: RequestService {
    private let http: HttpService

    public init(http: HttpService = Http()) {
        self.http = http
    }

    public func requestData(from request: RequestProtocol,
                            additionalHeaders: HttpHeaders = [:],
                            completion: HttpCompletion?) {

        http.request(request,
                     additionalHeaders: additionalHeaders,
                     completion: completion)
    }

    public func request<T: Decodable>(_ type: T.Type,
                                      from request: RequestProtocol,
                                      additionalHeaders: HttpHeaders = [:],
                                      completion: ((Result<T, Error>) -> Void)?) {

        http.request(request, additionalHeaders: additionalHeaders) { dataResult in

            switch dataResult {
            case .failure(let error):
                completion?(.failure(error))

            case .success(let data):
                let decoder = JSONDecoder()

                guard let decodedObject = try? decoder.decode(type, from: data) else {
                    let error = NSError(domain: "Fail to decode data", code: 1001, userInfo: nil)
                    completion?(.failure(error))
                    return
                }

                completion?(.success(decodedObject))
            }
        }
    }
}
