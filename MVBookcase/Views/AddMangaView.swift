//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct AddMangaView: View {
	
	var collection: Collection
	
	@Environment(\.managedObjectContext) var moc
	
	@State private var title = ""
	@State private var volume = 0
	@State private var status = VolumeStatus.bought
	
	
	var body: some View {
		
			Form {
				Section("New Manga") {
					TextField("Title", text: $title)
					
					HStack {
						TextField("Vol", value: $volume, format: .number)
							.keyboardType(.numberPad)
						
						Picker("", selection: $status) {
							Text("Bought").tag(VolumeStatus.bought)
							Text("Missing").tag(VolumeStatus.missing)
						}
					}
					
					Button("Create") {
						create()
					}
				}
			}
		.navigationTitle("Add manga")
		.navigationBarTitleDisplayMode(.inline)
	}
	
	func create() {
		var statusString: String {

			switch status {
			case .bought: return "bought"
			case .missing: return "missing"
			}
			
		}
		let manga = Manga(context: moc)
		manga.id = UUID()
		manga.title = title
		manga.volume = Int16(volume)
		manga.status = statusString
		
		collection.addToMangas(manga)
		
		try? moc.save()
	}
	
}
