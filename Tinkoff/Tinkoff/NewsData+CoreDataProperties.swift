//
//  NewsData+CoreDataProperties.swift
//  Tinkoff
//
//  Created by Lena Vorontsova on 11.11.2022.
//
//

import Foundation
import CoreData

extension NewsData {

    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<NewsData> {
        return NSFetchRequest<NewsData>(entityName: "NewsData")
    }

    @NSManaged public var dateOfCreation: String?
    @NSManaged public var photoPath: String?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var office: String?
    @NSManaged public var tag: String?
}
