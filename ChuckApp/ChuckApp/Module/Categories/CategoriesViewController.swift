//
//  ViewController.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

protocol CategoriesNavigationDelegate: class {
    func goToJokeDetail(fromCategory: String)
}

class CategoriesViewController: UIViewController {

    // MARK: - Properties

    var viewModel: CategoriesViewModelProtocol?

    private var myView: CategoriesView {
        // swiftlint:disable force_cast
        return view as! CategoriesView
        // swiftlint:enable force_cast
    }

    // MARK: - Life Cycle

    override func loadView() {
        let myView = CategoriesView()
        view = myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Joke Categories"

        let categoryViewModel = CategoriesViewModel(viewDelegate: myView,
                                                    service: JokeServices(),
                                                    navigation: self)

        viewModel = categoryViewModel
        myView.viewModel = categoryViewModel
    }

}

    // MARK: - Navigation

extension CategoriesViewController: CategoriesNavigationDelegate {

    func goToJokeDetail(fromCategory category: String) {
        let detailController = JokeDetailViewController(categoryName: category)
        self.navigationController?.pushViewController(detailController, animated: true)
    }

}
