//
//  APIService.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 18/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


public enum RequestType: String {
    case GET
}

protocol APIRequest {
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }
}
