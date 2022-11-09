//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//

import CoreData
import Foundation


public extension URL {

		/// Returns a URL for the given app group and database pointing to the sqlite database.
		static func storeURL(for appGroup: String, databaseName: String) -> URL {
				guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
						fatalError("Shared file container could not be created.")
				}

				return fileContainer.appendingPathComponent("\(databaseName).sqlite")
		}
}


class DataController: ObservableObject {
	
	let container = NSPersistentContainer(name: "MVBookcase")
	init() {

		let storeURL = URL.storeURL(for: "group.MVBookcase", databaseName: "MVBookcase")
		let storeDescription = NSPersistentStoreDescription(url: storeURL)		
		container.persistentStoreDescriptions = [storeDescription]
		container.loadPersistentStores { container, error in
			if let error = error {
				print("Core data failed to load \(error.localizedDescription)")
			}
			
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump

		}
	}
}
