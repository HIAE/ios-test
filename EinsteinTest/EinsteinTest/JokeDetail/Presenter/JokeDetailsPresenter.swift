//
//  JokeDetailsPresenter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

class JokeDetailsPresenter: JokeDetailsPresenterProtocol {
    
    var view: JokeDetailsViewProtocol?
    var interactor: JokeDetailsInteractorProtocol?
    var router: JokeDetailsRouter?
    var category: String?
    
    func getJoke() {
        self.interactor?.getRandomJoke(for: self.category)
        print ("ask joke for interactor")
    }
    
    func onGetRandomJokeSuccess(joke: JokeDetailsModel) {
        self.view?.updateWith(joke: joke)
    }
       
    func onGetRandomJokeError() {
        self.view?.showError()
    }
}
