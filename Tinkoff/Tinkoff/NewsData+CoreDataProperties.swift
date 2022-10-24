//
//  NewsData+CoreDataProperties.swift
//  
//
//  Created by Lena Vorontsova on 24.10.2022.
//
//

import Foundation
import CoreData


extension NewsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsData> {
        return NSFetchRequest<NewsData>(entityName: "NewsData")
    }

    @NSManaged public var title: String?
    @NSManaged public var text: String?
    @NSManaged public var photoPath: String?
    @NSManaged public var dateOfCreation: String?

}
