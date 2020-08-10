//
//  JokeDetailViewModel.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import UIKit

/// ViewModel's Delegate is the View
protocol JokeDetailViewModelDelegate: class {
    func reloadLabel()
    func reloadIcon(withImage: UIImage)
}

protocol JokeDetailViewModelProtocol {
    var jokeURL: URL? { get set }
    var joke: Joke? { get set }
    var services: JokeServicesProtocol { get set }
    var delegate: JokeDetailViewModelDelegate? { get set }
}

class JokeDetailViewModel: JokeDetailViewModelProtocol {

    // MARK: - Properties

    var jokeURL: URL?
    var joke: Joke?
    var services: JokeServicesProtocol
    weak var delegate: JokeDetailViewModelDelegate?

    // MARK: - Init

    init(categoryName: String, services: JokeServicesProtocol, delegate: JokeDetailViewModelDelegate) {
        self.services = services
        self.delegate = delegate

        // Create the URL for random joke at a category
        self.jokeURL = createJokeURL(fromCategory: categoryName)

        // Fetch Joke
        self.getJoke { [weak self] (image) in
            self?.delegate?.reloadIcon(withImage: image)
        }

    }

    // MARK: - get joke

    func getJoke(_ completion: @escaping (UIImage) -> Void) {

        guard let url = self.jokeURL else { return }

        services.fetchJoke(at: url) { [weak self] (joke) in
            self?.joke = joke
            self?.delegate?.reloadLabel()

            guard let url = self?.joke?.iconURL else { return }

            // Request the image
            let imageTask = URLSession.shared.dataTask(with: url) { (data, _, _) in

                guard let data = data, let image = UIImage(data: data) else { return }

                // The image should be saved at the correct position from the images array
                completion(image)
            }

            imageTask.resume()
        }
    }

    // MARK: - create joke URL

    func createJokeURL(fromCategory category: String) -> URL? {
        // This dictionary is used to construct the URL using URLComponents
        let query: [String: String] = [
            "category": category
        ]

        return self.services.baseURL.withQueries(query)
    }
}
