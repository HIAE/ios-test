//
//  ChuckNorrisService.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 18/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation
import RxSwift

enum ChuckNorrisError: Error {
    case jokeError
    case categoriesError
    
    var localizedDescription: String {
        switch self {
        case .jokeError:
            return "Não foi possível encontrar fatos sobre ChuckNoris no momento."
        case .categoriesError:
            return "Não foi possível comunicar com a API"
        }
    }
}

protocol ServiceInterface: AnyObject {
    func send<T: Decodable>(apiRequest: APIRequest) -> Observable<T>
}

class ChuckNorisService: ServiceInterface {
    private let baseURL = URL(string: "https://api.chucknorris.io/")!

    func send<T: Decodable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)

                } catch let error {
                    observer.onError(error)
                }

                observer.onCompleted()
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
