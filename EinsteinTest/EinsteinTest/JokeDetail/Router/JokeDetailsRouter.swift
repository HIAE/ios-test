//
//  JokeDetailsRouter.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class JokeDetailsRouter: JokeDetailsRouterProtocol {
    
    static func setupModuleReferences() -> JokeDetailsViewController {
       
        let jokeDetailsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "jokeDetailsView") as! JokeDetailsViewController
        
        let presenter = JokeDetailsPresenter()
        let interactor = JokeDetailsInteractor()
               
        jokeDetailsView.presenter = presenter
        presenter.view = jokeDetailsView
        presenter.router = JokeDetailsRouter()
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return jokeDetailsView
    }
}
