//
//  String+Extension.swift
//  HIAEChallenge
//
//  Created by Vinicius Custodio on 20/07/20.
//  Copyright © 2020 Vinicius Custodio. All rights reserved.
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
