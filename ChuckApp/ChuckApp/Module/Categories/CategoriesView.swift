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
    var cellId: String

    var viewModel: CategoriesViewModelProtocol?

    // MARK: - Init

    override init(frame: CGRect) {
        cellId = "categoryCollection"

        // Initialize CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
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
        // viewModel.count
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        // Cells are a square with side = Screen width / 4
        let side = collectionView.bounds.width/4.0

        return CGSize(width: side, height: side)
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
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
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
