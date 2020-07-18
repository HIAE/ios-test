//
//  CategoriesRequest.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 18/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation

class CategoriesRequest: APIRequest {
    var method = RequestType.GET
    var path = "/jokes/categories"
    var parameters = [String: String]()
}
