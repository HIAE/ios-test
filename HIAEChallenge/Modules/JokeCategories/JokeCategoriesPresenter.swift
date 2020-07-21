//
//  JokeCategoriesPresenter.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

final class JokeCategoriesPresenter: JokeCategoriesPresenterProtocol {

    private let interactor: JokeCategoriesInteractorProtocol!
    private let router: JokeCategoriesRouterProtocol!
    private let view: JokeCategoriesViewProtocol!

    var categories: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.view.loadCategories()
            }
        }
    }
    
    init(_ view: JokeCategoriesViewProtocol, _ router: JokeCategoriesRouterProtocol, _ interactor: JokeCategoriesInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        interactor.delegate = self
    }

    func loadCategories() {
        interactor.loadCategories()
    }

    func openJokeVC(for category: String) {
        router.navigate(JokeCategoriesRoutes.getJoke(category: category))
    }
    
    func dismiss() {
        
    }
}

extension JokeCategoriesPresenter: JokeCategoriesInteractorDelegate {
    func handle(_ output: JokeCategoriesInteractorOutputs) {
        switch output {
        case .sendData(let categories):
            self.categories = categories
            
        case .sendError(let error):
            DispatchQueue.main.async {
                self.view.errorLoadingCategories(error: error)
            }
        }
    }
}
