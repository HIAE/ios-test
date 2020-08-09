//
//  ViewController.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

protocol CategoriesNavigationDelegate: class {
    func goToJokeDetail()
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
        
        self.title = "Last week photos"

        let photoViewModel = CategoriesViewModel(navigation: self)

        viewModel = photoViewModel
        myView.viewModel = viewModel
    }

}

    // MARK: - Navigation

extension CategoriesViewController: CategoriesNavigationDelegate {

    func goToJokeDetail() {
        let detailController = JokeDetailViewController()
        self.navigationController?.pushViewController(detailController, animated: true)
    }

}
