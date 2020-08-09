//
//  CategoriesViewModel.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

/// ViewModel's Delegate is the View
protocol CategoriesViewModelDelegate: class {
    func reloadCollectionData()
}

/// This helps us to unit test
protocol CategoriesViewModelProtocol {
    var categories: [String] { get set }
    var navigationDelegate: CategoriesNavigationDelegate? { get set }
}

class CategoriesViewModel: CategoriesViewModelProtocol {

    // MARK: - Properties

    var categories: [String]

    var services: JokeServicesProtocol
    weak var delegate: CategoriesViewModelDelegate?
    weak var navigationDelegate: CategoriesNavigationDelegate?

    // MARK: - Init

    init(viewDelegate: CategoriesViewModelDelegate, service: JokeServicesProtocol, navigation: CategoriesNavigationDelegate) {
        categories = []

        services = service
        delegate = viewDelegate
        navigationDelegate = navigation

        // Get categories
        getAllJokeCategories()
    }

    // MARK: - Get all joke categories

    func getAllJokeCategories() {

        services.fetchAllJokeCategories { (categories) in
            if let categoryArray = categories {
                self.categories = categoryArray
                self.delegate?.reloadCollectionData()
            } else {
                // Treat error in a frendlier way
                print("Could not load data")
            }

        }
    }

}
