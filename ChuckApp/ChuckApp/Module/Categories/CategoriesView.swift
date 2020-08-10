//
//  CategoriesView.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

class CategoriesView: UIView {

    // MARK: - Properties

    var collectionView: UICollectionView
    var categoryCellId: String
    var collectionCellId: String

    var viewModel: CategoriesViewModelProtocol?

    // MARK: - Init

    override init(frame: CGRect) {
        categoryCellId = "categoryCollectionCell"
        collectionCellId = "collectionCell"

        // Initialize CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)

        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

    // MARK: - Collection View

extension CategoriesView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var numberOfSections: Int { return 1 }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        return viewModel.categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath)

        guard let viewModel = viewModel else { return cell }

        if let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as? CategoriesCollectionCell,
            let category = viewModel.categories[indexPath.row] {

            categoryCell.viewModel = CategoriesCollectionViewModel(categoryName: category)

            cell = categoryCell
        }

        return cell
    }

    // MARK: - Navigation

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel,
              let category = viewModel.categories[indexPath.row] else { return }

        viewModel.navigationDelegate?.goToJokeDetail(fromCategory: category)
    }

    // MARK: - Layout

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        // Adjusts cell width to fill whole collection view frame
        let cellWidth = Int(self.frame.width / 2) - 35
        return CGSize(width: cellWidth, height: 50)
    }

}

    // MARK: - Delegate

extension CategoriesView: CategoriesViewModelDelegate {

    /// Reload Table View on the main Thread
    func reloadCollectionData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

    // MARK: - ViewCodable

extension CategoriesView: ViewCodable {

    func configure() {
        configureCollectionView()
    }

    func setupHierarchy() {
        self.addSubview(collectionView)
    }

    func setupConstraints() {
        setCollectionViewContraints()
    }

    func render() {

        
    }

    // MARK: - ViewCodable Helpers

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoriesCollectionCell.self, forCellWithReuseIdentifier: categoryCellId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellId)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }

    func setCollectionViewContraints() {

        collectionView.setConstraints { (view) in
                   view.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
                   view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
                   // Apple Default tableView Spacing
                   view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
                   view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
               }
    }

}
