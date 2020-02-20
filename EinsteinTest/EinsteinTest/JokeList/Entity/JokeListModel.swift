//
//  JokeListModel.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 19/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

struct JokeListModel: Codable {
    
    let categories: [String]

     init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let categories = try container.decode([String].self)
        self.categories = categories
    }
}
