//
//  JokeDetailsModel.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

struct JokeDetailsModel: Codable {
    
    let joke: String
    let iconURL: String
    
    private enum codingKeys: String, CodingKey {
        case joke = "value"
        case iconURL = "url"
    }
}
