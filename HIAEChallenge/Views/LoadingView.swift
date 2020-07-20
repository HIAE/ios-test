//
//  LoadingView.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 20/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    var activityIndicator: UIActivityIndicatorView

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        self.activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        super.init(frame: frame)

        setupView()
    }

    fileprivate func setupView() {
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)

        setupActivityIndicator()
    }

    fileprivate func setupActivityIndicator() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.hidesWhenStopped = true
        
        self.addSubview(activityIndicator)

        self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }

    func startSpinner() {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        self.isHidden = false
    }

    func stopSpinner() {
        self.activityIndicator.stopAnimating()
        self.isHidden = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }
}
