//
//  CategoriesViewModel.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

protocol CategoriesViewModelProtocol {
    var categories: [String] { get set }
    var navigationDelegate: CategoriesNavigationDelegate? { get set }

}

class CategoriesViewModel: CategoriesViewModelProtocol {

    // MARK: - Properties

    var categories: [String]
    var navigationDelegate: CategoriesNavigationDelegate?

    // MARK: - Init

    init(navigation: CategoriesNavigationDelegate) {
        categories = []
        navigationDelegate = navigation
    }
}
