//
//  JokeDetailsInteractor.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import Alamofire

class JokeDetailsInteractor: JokeDetailsInteractorProtocol {
    
    var presenter: JokeDetailsPresenterProtocol?

    func getRandomJoke(for category: String?) {
        
        let _ = AF.request(self.getEndpoint(for: category))
            .validate()
            .responseDecodable(of: JokeDetailsModel.self) { (response) in
         
                if response.response?.statusCode == 200 {
                    if let joke = response.value {
                        self.presenter?.onGetRandomJokeSuccess(joke: joke)
                    } else {
                        self.presenter?.onGetRandomJokeError()
                    }
                } else {
                    self.presenter?.onGetRandomJokeError()
                }
        }
        
    }
    
    func getEndpoint(for category: String?) -> String {
    
        var baseURL = "https://api.chucknorris.io/jokes/random"
        
        if let category = category {
            baseURL.append("?category=\(category)")
        }
        
        return baseURL
    }
}
