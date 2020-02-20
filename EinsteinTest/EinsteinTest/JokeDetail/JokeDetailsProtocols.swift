//
//  JokeDetailsProtocols.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

protocol JokeDetailsViewProtocol: class {
    
    func updateWith(joke: JokeDetailsModel)
    func showError()
}

protocol JokeDetailsPresenterProtocol: class {
    
    var view: JokeDetailsViewProtocol? {get set}
    var interactor: JokeDetailsInteractorProtocol? {get set}
    var router: JokeDetailsRouter? {get set}
    var category: String? {get set}
    
    func getJoke()
    func onGetRandomJokeSuccess(joke: JokeDetailsModel)
    func onGetRandomJokeError()
}

protocol JokeDetailsInteractorProtocol: class {
    
    var presenter: JokeDetailsPresenterProtocol? {get set}

    func getRandomJoke(for category: String?)
}

protocol JokeDetailsRouterProtocol: class {
    
    static func setupModuleReferences() -> JokeDetailsViewController
}
