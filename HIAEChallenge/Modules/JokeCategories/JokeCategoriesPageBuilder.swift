//
//  JokeCategoriesPageBuilder.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit

struct JokeCategoriesPageBuilder {
    static func make() -> JokeCategoriesViewController {
        let destinationVC = JokeCategoriesViewController()
        let router = JokeCategoriesRouter(destinationVC)
        let interactor = JokeCategoriesInteractor()
        let presenter = JokeCategoriesPresenter(destinationVC,router,interactor)
        destinationVC.presenter = presenter
        return destinationVC
    }
}


