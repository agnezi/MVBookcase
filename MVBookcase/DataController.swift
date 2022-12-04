//
//
// MVBookcase
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//

import CoreData
import Foundation

class DataController: ObservableObject {
	
	let container = NSPersistentContainer(name: "MVBookcase")
	init() {
		container.loadPersistentStores { container, error in
			if let error = error {
				print("Core data failed to load \(error.localizedDescription)")
			}
			
			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump

		}
	}
}
