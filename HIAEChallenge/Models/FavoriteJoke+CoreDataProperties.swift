//
//  FavoriteJoke+CoreDataProperties.swift
//  
//
//  Created by Vinicius Custodio on 19/07/20.
//
//

import Foundation
import CoreData


extension FavoriteJoke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteJoke> {
        return NSFetchRequest<FavoriteJoke>(entityName: "FavoriteJoke")
    }

    @NSManaged public var iconUrl: URL?
    @NSManaged public var id: String?
    @NSManaged public var url: String?
    @NSManaged public var value: String?

}
