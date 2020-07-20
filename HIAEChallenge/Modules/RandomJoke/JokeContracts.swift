//
//  JokeContracts.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

//PRESENTER
@objc protocol JokePresenterProtocol: class  {
    var category:String? { get set }

    @objc func retrieveJoke()
    func openJokeUrl()
}

enum JokePresenterOutputs {
    case showError(String)
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
    case sendError(String)
    case sendData(joke: Joke)
}


/*------------------------*/
//ROUTER
protocol JokeRouterProtocol: class {
    func navigate(_ route: JokeRoutes)
    func openURL(_ url: URL)

}

enum JokeRoutes {
    
}

/*------------------------*/
//VIEW

protocol JokeViewProtocol: class {
    func showJoke(_ output: JokePresenterOutputs)
}








