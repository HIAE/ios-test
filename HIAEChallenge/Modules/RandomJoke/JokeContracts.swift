//
//  JokeContracts.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

//PRESENTER
protocol JokePresenterProtocol: class  {
    
}

enum JokePresenterOutputs {
    case showError(String)
    case showData
}

/*------------------------*/
//INTERACTOR
protocol JokeInteractorProtocol: class  {
    var delegate: JokeInteractorDelegate! {get set}
}

protocol JokeInteractorDelegate: class  {
    func handle(_ output: JokeInteractorOutputs)
}

enum JokeInteractorOutputs {
    case sendError(String)
    case sendData
}


/*------------------------*/
//ROUTER
protocol JokeRouterProtocol: class {
    func navigate(_ route: JokeRoutes)
}

enum JokeRoutes {
    
}

/*------------------------*/
//VIEW

protocol JokeViewProtocol: class {
    func handle(_ output: JokePresenterOutputs)
}








