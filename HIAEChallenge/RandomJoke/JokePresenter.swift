//
//  JokePresenter.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

final class JokePresenter: JokePresenterProtocol {
    
    private let interactor: JokeInteractorProtocol!
    private let router: JokeRouterProtocol!
    private let view: JokeViewProtocol!
    
    init(_ view: JokeViewProtocol, _ router: JokeRouterProtocol, _ interactor: JokeInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        interactor.delegate = self
    }
}

extension JokePresenter: JokeInteractorDelegate {
    func handle(_ output: JokeInteractorOutputs) {
        
    }
}
