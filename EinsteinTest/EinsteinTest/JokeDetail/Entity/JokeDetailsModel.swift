//
//  JokeDetailsModel.swift
//  EinsteinTest
//
//  Created by Pedro Lopes on 20/02/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

struct JokeDetailsModel: Decodable {
    
    let value: String
    let icon_url: String
    
//    enum codingKeys: String, CodingKey {
//        case joke
//        case iconURL
//    }
}
