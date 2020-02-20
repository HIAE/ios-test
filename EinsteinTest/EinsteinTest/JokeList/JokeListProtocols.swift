//
//  JokeListProtocols.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation


// View <-> Presenter //

protocol ViewToPresenterJokeListProtocol: class {
    
    func fetchJokeCategories()
}

protocol PresenterToViewJokeListProtocol:class {
    
    func onFetchJokeSuccess(jokeList: [String])
    func onFetchJokeError(error: String)
}
