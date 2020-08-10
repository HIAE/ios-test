//
//  JokeDetailViewController.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {

    // MARK: - Properties

    var viewModel: JokeDetailViewModelProtocol?
    var categoryName: String

    private var myView: JokeDetailView {
        // swiftlint:disable force_cast
        return view as! JokeDetailView
        // swiftlint:enable force_cast
    }

    // MARK: - Init

    init(categoryName name: String) {
        self.categoryName = name
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        let myView = JokeDetailView()
        view = myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Joke"

        let categoryViewModel = JokeDetailViewModel(categoryName: self.categoryName,
                                                    services: JokeServices())

        viewModel = categoryViewModel
        myView.viewModel = categoryViewModel
    }
}
