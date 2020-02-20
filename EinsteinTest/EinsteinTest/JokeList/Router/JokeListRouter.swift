//
//  JokeListRouter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

class JokeListRouter {
    
    static func setupModuleReferences(from listView: JokeListTableViewController) {
        
        let presenter = JokeListPresenter()
        let interactor = JokeListInteractor()
        
        listView.presenter?.view = listView
        listView.presenter?.interactor = JokeListInteractor()
        listView.presenter?.router = JokeListRouter()
        interactor.presenter = presenter
        
        listView.presenter = presenter
    }
    
    func openJoke() {
        print("Joke to open")
    }
}
