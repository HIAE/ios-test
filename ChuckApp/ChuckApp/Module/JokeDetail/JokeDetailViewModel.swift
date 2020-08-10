//
//  JokeDetailViewModel.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import Foundation

protocol JokeDetailViewModelProtocol {
    var jokeURL: URL? { get set }
    var joke: Joke? { get set }
    var services: JokeServicesProtocol { get set }
}

class JokeDetailViewModel: JokeDetailViewModelProtocol {

    // MARK: - Properties

    var jokeURL: URL?
    var joke: Joke?
    var services: JokeServicesProtocol

    // MARK: - Init

    init(categoryName: String, services: JokeServicesProtocol) {
        self.services = services

        // Create the URL for random joke at a category
        self.jokeURL = createJokeURL(fromCategory: categoryName)

        // Fetch Joke
        self.getJoke()
    }

    // MARK: - get joke

    func getJoke() {

        guard let url = self.jokeURL else { return }

        services.fetchJoke(at: url) { (joke) in
            self.joke = joke
            print(joke)
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
