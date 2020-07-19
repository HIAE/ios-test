//
//  JokeCategoriesPresenter.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

final class JokeCategoriesPresenter: JokeCategoriesPresenterProtocol {
    
    private let interactor: JokeCategoriesInteractorProtocol!
    private let router: JokeCategoriesRouterProtocol!
    private let view: JokeCategoriesViewProtocol!
    
    init(_ view: JokeCategoriesViewProtocol, _ router: JokeCategoriesRouterProtocol, _ interactor: JokeCategoriesInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        interactor.delegate = self
    }
}

extension JokeCategoriesPresenter: JokeCategoriesInteractorDelegate {
    func handle(_ output: JokeCategoriesInteractorOutputs) {
        switch output {
        case .sendData(let categories):
            view.handle()
            
        case .sendError(let error):
    }
}
