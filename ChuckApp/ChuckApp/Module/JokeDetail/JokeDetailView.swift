//
//  JokeDetailView.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

class JokeDetailView: UIView {

    // MARK: - Properties

    var jokeLabel: UILabel
    var iconView: UIImageView

    var viewModel: JokeDetailViewModel?

    // MARK: - Init

    override init(frame: CGRect) {
        jokeLabel = UILabel()
        iconView = UIImageView()

        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - Delegate

extension JokeDetailView: JokeDetailViewModelDelegate {

    func reloadLabel() {
        configure()
    }

    func reloadIcon(withImage image: UIImage) {
        configureIcon(withImage: image)
    }
}

    // MARK: - View Codable

extension JokeDetailView: ViewCodable {

    func configure() {
        guard let viewModel = viewModel,
              let jokeText = viewModel.joke?.jokeText else { return }

        // UI Code should run on main Thread
        DispatchQueue.main.async {
            self.jokeLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.jokeLabel.textAlignment = .center
            self.jokeLabel.numberOfLines = 0
            self.jokeLabel.text = jokeText
            // After the view is configured
            self.setJokeLabelConstraints()
        }
    }

    func setupHierarchy() {
        self.addSubviews(jokeLabel, iconView)
    }

    func setupConstraints() {
        setIconViewConstraints()
        // Label constraints are set later
    }

    func render() {
        self.backgroundColor = .white
    }

      // MARK: - ViewCodable Helpers

    func configureIcon(withImage image: UIImage) {
        DispatchQueue.main.async {
            self.iconView.image = image
        }
    }

    func setIconViewConstraints() {
           iconView.setConstraints { (view) in
               view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
               view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
           }
       }

    func setJokeLabelConstraints() {
        jokeLabel.setConstraints { (view) in
            // At least keep distance greater then 16 points
            view.topAnchor.constraint(greaterThanOrEqualTo: iconView.bottomAnchor, constant: 16).isActive = true
            // Give a label a width (leading and trailing) that for a given font Size it will calculate its own height
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        }
    }

}
