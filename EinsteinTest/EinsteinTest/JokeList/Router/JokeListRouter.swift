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
        
        listView.presenter = presenter
        presenter.view = listView
        presenter.router = JokeListRouter()
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    func openJoke() {
        print("Joke to open")
    }
}
