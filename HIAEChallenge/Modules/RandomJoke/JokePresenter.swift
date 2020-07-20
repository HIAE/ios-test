//
//  JokePresenter.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

final class JokePresenter: JokePresenterProtocol {
    var category: String?
    var joke: Joke?

    private let interactor: JokeInteractorProtocol!
    private let router: JokeRouterProtocol!
    private let view: JokeViewProtocol!
    
    init(_ view: JokeViewProtocol, _ router: JokeRouterProtocol, _ interactor: JokeInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        interactor.delegate = self
    }

    func retrieveJoke() {
        interactor.getJoke(category: category ?? "")
    }

    func openJokeUrl() {
        if let url = joke?.url {
            router.openURL(url)
        }
    }
}

extension JokePresenter: JokeInteractorDelegate {
    func handleJokeRetrieve(_ output: JokeInteractorOutputs) {
        switch output {
        case .sendData(let joke):
            self.joke = joke
            DispatchQueue.main.async {
                self.view.showJoke(JokePresenterOutputs.showData(joke: joke))
            }
        case .sendError(let error):
            self.view.showJoke(JokePresenterOutputs.showError(error))
        }
    }
}
