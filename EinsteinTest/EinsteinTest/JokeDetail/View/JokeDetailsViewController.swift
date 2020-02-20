//
//  JokeDetailsViewController.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class JokeDetailsViewController: UIViewController {
    
    var presenter: JokeDetailsPresenterProtocol?
    let loadingIcon = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var jokeIcon: UIImageView!
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBAction func randomizeJokeAction(_ sender: Any) {
        self.presenter?.getJoke()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "piada"
        self.loadingData()
        self.presenter?.getJoke()
    }
    
    func loadingData() {

        self.loadingIcon.translatesAutoresizingMaskIntoConstraints = false
        self.loadingIcon.startAnimating()
        self.loadingIcon.hidesWhenStopped = true
        self.view.addSubview(loadingIcon)
        self.loadingIcon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loadingIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}

extension JokeDetailsViewController: JokeDetailsViewProtocol {
  
    func updateWith(joke: JokeDetailsModel) {
        self.jokeLabel.text = joke.value
        print ("Joke: \(joke.value)")
        print ("Icon: \(joke.icon_url)")
        
        self.loadingIcon.stopAnimating()
    }
    
    func showError() {
        let errorAlert = UIAlertController(title: "Oops", message: "A API levou um Roundhouse Kick do chuck. Tente novamente.", preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
       
        self.loadingIcon.stopAnimating()
        self.present(errorAlert, animated: true, completion: nil)
    }
}
