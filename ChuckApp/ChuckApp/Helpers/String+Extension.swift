//
//  String+Extension.swift
//  ChuckApp
//
//  Created by Ivo Dutra on 10/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
