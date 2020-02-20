//
//  JokeDetailsInteractor.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

class JokeDetailsInteractor: JokeDetailsInteractorProtocol {
    
    var presenter: JokeDetailsPresenterProtocol?

    func getRandomJoke(for category: String?) {
        print("Get new joke for category: \(category ?? "NO CATEGORY")")
        
        let newJoke = JokeDetailsModel(joke: "This is a joke example", iconURL: "URLEXAMPLE")
        
        self.presenter?.onGetRandomJokeSuccess(joke: newJoke)
    }
}
