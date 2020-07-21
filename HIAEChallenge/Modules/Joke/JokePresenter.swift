//
//  JokePresenter.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

final class JokePresenter: JokePresenterProtocol {
    var jokes: [Joke] = []
    var currentIndex: Int = -1 // No Joke retrieved
    
    var category: String?

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
        view.addLoadingView()
        interactor.getJoke(category: category ?? "")
    }

    func openJokeUrl() {
        if let url = jokes[currentIndex].url {
            router.openURL(url)
        }
    }
    
    func nextJoke() {
        if currentIndex + 1 < jokes.count {
            currentIndex += 1
            displayJoke()
            
        } else {
            retrieveJoke()
        }
    }
    
    func backJoke() {
        if currentIndex != 0 {
            currentIndex -= 1
            displayJoke()
            
            if currentIndex == 0 {
                view.backJokeButton(isEnabled: false)
            }
        }
    }
    
    func displayJoke() {
        DispatchQueue.main.async {
            if self.currentIndex != 0 {
                self.view.backJokeButton(isEnabled: true)
            }
            
            self.view.showJoke(JokePresenterOutputs.showData(joke: self.jokes[self.currentIndex]))
            self.view.removeLoadingView()
        }
    }
    
    func dismiss() {
        router.dismiss()
    }
}

extension JokePresenter: JokeInteractorDelegate {
    func handleJokeRetrieve(_ output: JokeInteractorOutputs) {
        switch output {
        case .sendData(let joke):
            self.currentIndex += 1
            self.jokes.append(joke)
            self.displayJoke()
            
        case .sendError(let error):
            DispatchQueue.main.async {
                self.view.showJoke(JokePresenterOutputs.showError(error))
            }
        }
    }
}
