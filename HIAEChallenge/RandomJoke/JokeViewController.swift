//
//  JokeVC.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController, JokeViewProtocol {
    var presenter: JokePresenterProtocol!
    
    weak var tableView: UITableView! {
        let tableView = UITableView()
        
        return tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    fileprivate func setUI() {
        
    }
}

extension JokeViewController {
    func handle(_ output: JokePresenterOutputs) {
        
    }
}

