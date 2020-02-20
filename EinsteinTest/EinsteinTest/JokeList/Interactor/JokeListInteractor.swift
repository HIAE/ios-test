//
//  JokeListInteractor.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import Alamofire

class JokeListInteractor {

    fileprivate static let categoryListEndpoint: String = "https://api.chucknorris.io/jokes/categories"
    var presenter: JokeListPresenterProtocol?
    
}

extension JokeListInteractor: JokeListInteractorProtocol {
   
    func fetchCategories() {
       
        let request = AF.request(JokeListInteractor.categoryListEndpoint)

        request.responseJSON { (data) in
            print("LIST RESPONSE")
            print(data)
        }
    }
}
