//
//  JokeCategoriesContracts.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

//PRESENTER
protocol JokeCategoriesPresenterProtocol: class  {
    
}

enum JokeCategoriesPresenterOutputs {
    case showError(String)
    case showData
}

/*------------------------*/
//INTERACTOR
protocol JokeCategoriesInteractorProtocol: class  {
    var delegate: JokeCategoriesInteractorDelegate! {get set}
}

protocol JokeCategoriesInteractorDelegate: class  {
    func handle(_ output: JokeCategoriesInteractorOutputs)
}

enum JokeCategoriesInteractorOutputs {
    case sendError(String)
    case sendData
}


/*------------------------*/
//ROUTER
protocol JokeCategoriesRouterProtocol: class {
    func navigate(_ route: JokeCategoriesRoutes)
}

enum JokeCategoriesRoutes {
    
}

/*------------------------*/
//VIEW

protocol JokeCategoriesViewProtocol: class {
    func handle(_ output: JokeCategoriesPresenterOutputs)
}








