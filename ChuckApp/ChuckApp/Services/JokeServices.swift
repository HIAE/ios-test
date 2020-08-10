//
//  JokeServices.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 08/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import Foundation

protocol JokeServicesProtocol {
    var baseURL: URL { get set }
    var categoriesURL: URL { get set }
    func fetchJoke(at url: URL, completion: @escaping (Joke?) -> Void)
    func fetchAllJokeCategories(completion: @escaping ([String]?) -> Void)
}

class JokeServices: JokeServicesProtocol {

    // MARK: - Properties

    var baseURL: URL
    var categoriesURL: URL

    // MARK: - Init

    init() {
        baseURL = URL(string: "https://api.chucknorris.io/jokes/random")!
        categoriesURL = URL(string: "https://api.chucknorris.io/jokes/categories")!
    }

    // MARK: - Fetch joke

    func fetchJoke(at url: URL, completion: @escaping (Joke?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            // Handle Errors
            if let error = error {
                self.handleClientError(error)
                return
            }

            // Handle Response
            // 200-299 status codes are Successful responses
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            }

            let jsonDecoder = JSONDecoder()

            if let data = data, let joke = try? jsonDecoder.decode(Joke.self, from: data) {
                completion(joke)
            } else {
                print("No data returned")
                completion(nil)
            }

        }

        task.resume()
    }

    // MARK: - Fetch Categories

    func fetchAllJokeCategories(completion: @escaping ([String]?) -> Void) {

        let task = URLSession.shared.dataTask(with: categoriesURL) { (data, response, error) in

            // Handle Errors
            if let error = error {
                self.handleClientError(error)
                return
            }

            // Handle Response
            // 200-299 status codes are Successful responses
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            }

            // Decode data
            let jsonDecoder = JSONDecoder()
            if let data = data, let categories = try? jsonDecoder.decode([String].self, from: data) {
                completion(categories)
            } else {
                print("No data returned")
                completion(nil)
            }

        }

        task.resume()
    }

    // MARK: - Errors

    func handleClientError(_ error: Error) {
        // Todo
    }

    func handleServerError(_ response: URLResponse?) {
        // Todo
    }
}
