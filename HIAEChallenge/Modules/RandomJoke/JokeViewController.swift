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
    
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var jokeUrl: UILabel!
    @IBOutlet var jokeLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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

