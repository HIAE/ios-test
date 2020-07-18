//
//  JokeCategoriesVC.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit

class JokeCategoriesViewController: UIViewController, JokeCategoriesViewProtocol {
    var presenter: JokeCategoriesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    fileprivate func setUI() {
        
    }
}

extension JokeCategoriesViewController {
    func handle(_ output: JokeCategoriesPresenterOutputs) {
        
    }
}

