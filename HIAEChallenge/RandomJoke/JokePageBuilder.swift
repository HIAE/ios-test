//
//  JokePageBuilder.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit

struct JokePageBuilder {
    static func make() -> JokeViewController {
        let destinationVC = JokeViewController()
        let router = JokeRouter(destinationVC)
        let interactor = JokeInteractor()
        let presenter = JokePresenter(destinationVC,router,interactor)
        destinationVC.presenter = presenter
        return destinationVC
    }
}


