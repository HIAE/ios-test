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

    @IBOutlet var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    fileprivate func setUI() {
        loadingView.startSpinner()
        presenter.loadCategories()
        
        self.navigationItem.title = "Categorias"
    }
}

extension JokeCategoriesViewController {
    func loadCategories() {
        tableView.reloadData()
        loadingView.stopSpinner()
    }

    func errorLoadingCategories(error: ChuckNorrisError) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Tentar Novamente", style: .cancel, handler: { _ in
            self.loadingView.startSpinner()
            self.presenter.loadCategories()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension JokeCategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = presenter.categories[indexPath.row].capitalizingFirstLetter()

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let category = presenter.categories[indexPath.row]
        presenter.openJokeVC(for: category)
    }


}

