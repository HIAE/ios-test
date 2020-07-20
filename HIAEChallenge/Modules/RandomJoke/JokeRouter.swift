//
//  JokeRouter.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit

final class JokeRouter: JokeRouterProtocol {
    unowned let vc: UIViewController!
    
    init(_ view: UIViewController) {
        self.vc = view
    }
    
    func navigate(_ route: JokeRoutes) {
        
    }

    func openURL(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
