import Foundation

public final class RawService: RequestService {
    private let http: HttpService
    private var decoder: JSONDecoder

    public init(decoder: JSONDecoder? = nil, http: HttpService = Http()) {
        self.http = http
        self.decoder = RawService.generateDecoder(from: decoder)
    }

    public func requestData(from request: RequestModel,
                            additionalHeaders: HttpHeaders = [:],
                            completion: HttpCompletion?) {

        http.request(request,
                     additionalHeaders: additionalHeaders,
                     completion: completion)
    }

    public func request<T: Decodable>(_ type: T.Type,
                                      from request: RequestModel,
                                      additionalHeaders: HttpHeaders = [:],
                                      completion: ((Result<T, Error>) -> Void)?) {

        http.request(request, additionalHeaders: additionalHeaders) { dataResult in

            switch dataResult {
            case .failure(let error):
                completion?(.failure(error))

            case .success(let data):

                guard let decodedObject = try? self.decoder.decode(type, from: data) else {
                    let error = NSError(domain: "Fail to decode data", code: 1001, userInfo: nil)
                    completion?(.failure(error))
                    return
                }

                completion?(.success(decodedObject))
            }
        }
    }

    static private func generateDecoder(from decoder: JSONDecoder?) -> JSONDecoder {
        if let jsonDecoder = decoder {
            return jsonDecoder
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
