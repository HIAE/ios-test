//
//  JokeListPresenter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class JokeListPresenter: JokeListPresenterProtocol {

    var view: JokeListViewProtocol?
    var interactor: JokeListInteractorProtocol?
    var router: JokeListRouter?
        
    func fetchJokeCategories() {
        
        self.interactor?.fetchCategories()
    }
    
    func onFetchJokeSuccess(jokeList: [String]) {
        self.view?.showCategories(jokeList)
    }
       
    func onFetchJokeError(error: String) {
        self.view?.showError(error: error)
    }
    
    func goToJoke(with category: String, navController: UINavigationController) {
        self.router?.openJoke(from: navController, category: category)
    }
}
