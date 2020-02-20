//
//  JokeListRouter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class JokeListRouter: JokeListRouterProtocol{
    
    static func setupModuleReferences(from listView: JokeListTableViewController) {
        
        let presenter = JokeListPresenter()
        let interactor = JokeListInteractor()
        
        listView.presenter = presenter
        presenter.view = listView
        presenter.router = JokeListRouter()
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    func openJoke(from navController: UINavigationController, category: String) {
      
        let jokeDetailsView: JokeDetailsViewController = JokeDetailsRouter.setupModuleReferences(with: category)
        navController.pushViewController(jokeDetailsView ,animated: true)
    }
}
