//
//
// MVBookcase
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//
import Foundation
import CoreData


extension Manga {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Manga> {
        return NSFetchRequest<Manga>(entityName: "Manga")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var status: String?
    @NSManaged public var title: String?
    @NSManaged public var volume: Int16
    @NSManaged public var collection: Collection?
	
	var wrappedStatus: String {
		return status ?? "missing"
	}
	
	var wrappedTitle: String {
		return title ?? ""
	}
	
	var wrappedVolume: Int {
		return Int(volume)
	}

}

extension Manga : Identifiable {

}
