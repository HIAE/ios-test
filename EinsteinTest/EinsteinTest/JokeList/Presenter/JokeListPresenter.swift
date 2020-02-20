//
//  JokeListPresenter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

class JokeListPresenter: ViewToPresenterJokeListProtocol {
   
    var view: PresenterToViewJokeListProtocol?
    
    func fetchJokeCategories() {
        
        print ("List Presenter: Fetching Movies")
    }
}
