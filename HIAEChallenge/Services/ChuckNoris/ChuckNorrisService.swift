//
//  ChuckNorrisService.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 18/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ChuckNorisService {
    private let baseURL = URL(string: "https://api.chucknorris.io/")!

    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
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
