//
//  JokeListTableViewController.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class JokeListTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var presenter: JokeListPresenterProtocol?
    let loadingIcon = UIActivityIndicatorView(style: .large)
    var jokeList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "categorias"
        self.loadingData()

        JokeListRouter.setupModuleReferences(from: self)
        self.presenter?.fetchJokeCategories()
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

extension JokeListTableViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jokeList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let categoryCell = self.tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! JokeCategoryTableViewCell
        categoryCell.categoryTitleLabel?.text = self.jokeList[indexPath.row]
        
        return categoryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.presenter?.goToJoke(with: jokeList[indexPath.row], navController: self.navigationController!)
        self.tableView.cellForRow(at: indexPath)?.setSelected(false, animated: false)
    }
}

extension JokeListTableViewController: JokeListViewProtocol {
    
    func showCategories(_ categories: [String]) {
        self.jokeList = categories
        self.tableView.reloadData()
        self.loadingIcon.stopAnimating()
    }
    
    func showError(error: String) {
        print ("Error on joke category list: \(error)")
        self.loadingIcon.stopAnimating()
    }
    
    
}
