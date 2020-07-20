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

    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var jokeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    fileprivate func setUI() {
        addRetryButton()
        retrieveJoke()
    }

    @objc func retrieveJoke() {
        loadingView.startSpinner()
        presenter.retrieveJoke()
    }

    /**
     * Add retry button to navigationBar
     */
    func addRetryButton() {
        let navigationItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "retry_symbol"), style: .done,
                                                              target: self, action: #selector(retrieveJoke))
        self.navigationItem.rightBarButtonItems = [navigationItem]
    }

    @IBAction func didPressedOpenURL(_ sender: Any) {
        presenter.openJokeUrl()
    }
}

extension JokeViewController {
    func showJoke(_ output: JokePresenterOutputs) {
        switch output {
        case .showData(let joke):
            self.presentJoke(joke: joke)

        case .showError(let error):
            self.showErrorMessage(error: error)
        }

        loadingView.stopSpinner()
    }

    func presentJoke(joke: Joke) {
        self.jokeLabel.text = joke.value
        self.iconImage.sd_setImage(with: joke.iconUrl, completed: nil)
    }

    func showErrorMessage(error: String) {

    }
}

