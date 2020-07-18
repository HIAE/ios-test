//
//  JokeCategoriesInteractor.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import RxSwift
import RxCocoa

final class JokeCategoriesInteractor: JokeCategoriesInteractorProtocol {
    weak var delegate: JokeCategoriesInteractorDelegate!

    let chuckNorisService = ChuckNorisService()

    func getCategories(category: String) {
        
    }
}
