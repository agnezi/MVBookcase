//
// MVBookcase
// Created by: itsjagnezi on 28/11/22
// Copyright (c) today and beyond
//
//

import Foundation
import CoreData


extension Collection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var mangas: NSSet?
	
	var wrappedTitle: String {
			return title ?? "Unknown Title"
		}
		
		var mangasArr: [Manga] {
			let set = mangas as? Set<Manga> ?? []
			return set.sorted { $0.wrappedVolume > $1.wrappedVolume }
		}


}

// MARK: Generated accessors for mangas
extension Collection {

    @objc(addMangasObject:)
    @NSManaged public func addToMangas(_ value: Manga)

    @objc(removeMangasObject:)
    @NSManaged public func removeFromMangas(_ value: Manga)

    @objc(addMangas:)
    @NSManaged public func addToMangas(_ values: NSSet)

    @objc(removeMangas:)
    @NSManaged public func removeFromMangas(_ values: NSSet)

}

extension Collection : Identifiable {

}
