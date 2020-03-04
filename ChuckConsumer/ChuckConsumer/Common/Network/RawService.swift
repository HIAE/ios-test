import Foundation

extension Networking {
    public class RawService {
        
        let http : HTTP
        
        public init(http:HTTP = HTTP()) {
            self.http = http
        }
        
        func rawRequestData(from request:RequestProtocol,
                         additionalHeaders:Headers = [:],
                         completion: HTTP.Completion?) {
            
            http.request(request, completion: completion)
        }
        
        func rawRequest<T:Decodable>(_ type:T.Type,
                                  from request:RequestProtocol,
                                  additionalHeaders:Headers = [:],
                                  completion:((Result<T, Error>) -> Void)?) {
            
            http.request(request) { dataResult in
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
}
