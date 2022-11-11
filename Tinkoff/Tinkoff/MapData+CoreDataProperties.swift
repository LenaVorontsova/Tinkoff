//
//  MapData+CoreDataProperties.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 11.11.2022.
//
//

import Foundation
import CoreData

extension MapData {

    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<MapData> {
        return NSFetchRequest<MapData>(entityName: "MapData")
    }

    @NSManaged public var lat: String?
    @NSManaged public var lng: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
}
