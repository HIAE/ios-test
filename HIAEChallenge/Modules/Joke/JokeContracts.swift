//
//  JokeContracts.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

//PRESENTER
protocol JokePresenterProtocol: class  {
    var category:String? { get set }
    
    func retrieveJoke()
    func openJokeUrl()
    func nextJoke()
    func backJoke()
    
    func dismiss()
}

enum JokePresenterOutputs {
    case showError(ChuckNorrisError)
    case showData(joke: Joke)
}

/*------------------------*/
//INTERACTOR
protocol JokeInteractorProtocol: class  {
    var delegate: JokeInteractorDelegate! {get set}

    func getJoke(category: String)
}

protocol JokeInteractorDelegate: class  {
    func handleJokeRetrieve(_ output: JokeInteractorOutputs)
}

enum JokeInteractorOutputs {
    case sendError(ChuckNorrisError)
    case sendData(joke: Joke)
}


/*------------------------*/
//ROUTER
protocol JokeRouterProtocol: class {
    func navigate(_ route: JokeRoutes)
    func openURL(_ url: URL)
    
    func dismiss()
}

enum JokeRoutes {
    
}

/*------------------------*/
//VIEW

protocol JokeViewProtocol: class {
    func showJoke(_ output: JokePresenterOutputs)
    func backJokeButton(isEnabled: Bool)
    func addLoadingView()
    func removeLoadingView()
}








