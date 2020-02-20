//
//  JokeListPresenter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

class JokeListPresenter: JokeListPresenterProtocol {
      
    var view: JokeListViewProtocol?
    var interactor: JokeListInteractorProtocol?
    var router: JokeListRouter?
    
    func fetchJokeCategories() {
        
        
        print ("List Presenter: Fetching Movies")
    }
    
    func onFetchJokeSuccess(jokeList: [String]) {
           print("Success List")
    }
       
    func onFetchJokeError(error: String) {
        print ("error list: \(error)")
    }
}
