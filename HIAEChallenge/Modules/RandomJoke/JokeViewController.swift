//
//  JokeVC.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 17/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit
import SDWebImage

class JokeViewController: UIViewController, JokeViewProtocol {
    
    var presenter: JokePresenterProtocol!

    lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()

        view.addSubview(loadingView)

        loadingView.translatesAutoresizingMaskIntoConstraints = false

        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        loadingView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        return loadingView
    }()

    @IBOutlet var backJokeButton: UIButton!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var jokeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    fileprivate func setUI() {
        retrieveJoke()
    }

    @objc func retrieveJoke() {
        presenter.retrieveJoke()
    }

    @IBAction func didPressedOpenURL(_ sender: Any) {
        presenter.openJokeUrl()
    }
    
    @IBAction func didPressedBack(_ sender: Any) {
        presenter.backJoke()
    }
    
    @IBAction func didPressedNext(_ sender: Any) {
        presenter.nextJoke()
    }
    
    func backJokeButton(isEnabled: Bool) {
        self.backJokeButton.isEnabled = isEnabled
    }
    
    func addLoadingView() {
        loadingView.startSpinner()
    }
    
    func removeLoadingView() {
        loadingView.stopSpinner()
    }
}

extension JokeViewController {
    func showJoke(_ output: JokePresenterOutputs) {
        switch output {
        case .showData(let joke):
            self.presentJoke(joke: joke)

        case .showError(let error):
            DispatchQueue.main.async {
                self.showErrorMessage(error: error)
            }
            
        }
        
        DispatchQueue.main.async {
            self.loadingView.stopSpinner()
        }
        
    }

    func presentJoke(joke: Joke) {
        self.jokeLabel.text = joke.value
        self.iconImage.sd_setImage(with: joke.iconUrl, completed: nil)
    }

    func showErrorMessage(error: ChuckNorrisError) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.presenter.dismiss()
        }))
        
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { _ in
            self.presenter.retrieveJoke()    
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
}

