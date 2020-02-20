//
//  JokeListInteractor.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import Alamofire

class JokeListInteractor: JokeListInteractorProtocol {

    fileprivate static let categoryListEndpoint: String = "https://api.chucknorris.io/jokes/categories"
    var presenter: JokeListPresenterProtocol?
   
    func fetchCategories() {
       
        let _ = AF.request(JokeListInteractor.categoryListEndpoint)
            .validate()
            .responseDecodable(of: [String].self) { (response) in
                guard let categories = response.value else {return}
            
                if response.response?.statusCode == 200 {
                    self.presenter?.onFetchJokeSuccess(jokeList: categories)
                } else {
                    self.presenter?.onFetchJokeError(error: "Erro ao solicitar categorias")
                }
        }
    }
}
