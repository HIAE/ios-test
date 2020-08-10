//
//  CategoriesCollectionCell.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 09/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {

     // MARK: - Properties

    var categoryLabel: UILabel

    var viewModel: CategoriesCollectionViewModel? {
        didSet {
            render()
            configure()
        }
    }
    
    // MARK: - Init

    override init(frame: CGRect) {
        categoryLabel = UILabel()

        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

    // MARK: - ViewCodable

extension CategoriesCollectionCell: ViewCodable {

    func configure() {
        configureLabel()
    }

    func setupHierarchy() {
        self.addSubviews(categoryLabel)
    }

    func setupConstraints() {
        setLabelContraints()
    }

    func render() {
        categoryLabel.font = UIFont.systemFont(ofSize: 20)
        // Colors according to ChuckNorrisAPI
        self.backgroundColor = .orange
        self.layer.cornerRadius = 10
    }

     // MARK: - ViewCodable Helpers

    func configureLabel() {
        guard let viewModel = viewModel else { return }
        categoryLabel.numberOfLines = 1
        categoryLabel.text = viewModel.categoryName
    }

    func setLabelContraints() {
        // Label has already height and width set due to its font
        categoryLabel.setConstraints { (view) in
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
    }
}
