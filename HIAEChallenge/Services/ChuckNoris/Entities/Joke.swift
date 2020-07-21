//
//  Joke.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 19/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

struct Joke: Decodable {
    let iconUrl: URL
    let id: String
    let url: URL?
    let value: String

    private enum CodingKeys: String, CodingKey {
        case iconUrl = "icon_url"
        case id = "id"
        case url = "url"
        case value = "value"
    }
}
