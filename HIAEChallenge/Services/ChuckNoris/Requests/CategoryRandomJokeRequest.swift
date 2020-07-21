//
//  RandomJokeRequest.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 18/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

class CategoryRandomJokeRequest: APIRequest {
    var method = RequestType.GET
    var path = "/jokes/random"
    var parameters = [String: String]()

    init(category: String) {
        parameters["category"] = category
    }
}
