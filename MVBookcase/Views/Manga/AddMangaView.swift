//
//
// MVBookcase
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct AddMangaView: View {
	
	@ObservedObject var collection: Collection
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	
	@State private var volume = 0
	@State private var title = ""
	@State private var status = VolumeStatus.bought
	
	var statusString: String {
		switch status {
		case .bought: return "bought"
		case .missing: return "missing"
		case .delivery: return "delivery"
		case .all: return "all"
		}
	}
	
	
	var body: some View {
		Form {
			Section("New Manga") {
				HStack {
					
					TextField("Title", text: $title)
					
					TextField("Vol", value: $volume, format: .number)
						.keyboardType(.numberPad)
					
				}
				
				MangaStatusPickerComponent(status: $status)
				
				Button("Add") {
					createMangaAndPersist()
				}
			}
		}
		.navigationTitle("Add manga")
		.navigationBarTitleDisplayMode(.inline)
	}

	func createMangaAndPersist() {
		
		let manga = Manga(context: moc)
		manga.id = UUID()
		manga.volume = Int16(volume)
		manga.status = statusString
		
		collection.addToMangas(manga)
		do {
			if(moc.hasChanges) {
				try moc.save()
			}
		} catch {
			print("Error on create Manga: \(error.localizedDescription)")
		}
		
		dismiss()
	}
	
}
