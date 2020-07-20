//
//  JokeCategoriesContracts.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

//PRESENTER
protocol JokeCategoriesPresenterProtocol: class  {
    var categories:[String] { get }

    func loadCategories()
    func openJokeVC(for category: String) 
}

enum JokeCategoriesPresenterOutputs {
    case showError(String)
    case showData
}

/*------------------------*/
//INTERACTOR
protocol JokeCategoriesInteractorProtocol: class  {
    var delegate: JokeCategoriesInteractorDelegate! {get set}

    func loadCategories()
}

protocol JokeCategoriesInteractorDelegate: class  {
    func handle(_ output: JokeCategoriesInteractorOutputs)
}

enum JokeCategoriesInteractorOutputs {
    case sendError(String)
    case sendData(categories: [String])
}


/*------------------------*/
//ROUTER
protocol JokeCategoriesRouterProtocol: class {
    func navigate(_ route: JokeCategoriesRoutes)
}

enum JokeCategoriesRoutes {
    case getJoke(category: String)
}

/*------------------------*/
//VIEW

protocol JokeCategoriesViewProtocol: class {
    func loadCategories()
    func errorLoadingCategories(error: String)
}








