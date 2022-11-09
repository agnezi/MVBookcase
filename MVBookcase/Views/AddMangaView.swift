//
//
// CupcakeCorner
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
	
	@State private var amountOfVolumes = 1.0
	@State private var isEditingSlide = false
	
	
	var statusString: String {
		switch status {
		case .bought: return "bought"
		case .missing: return "missing"
		case .delivery: return "delivery"
		}
	}
	
	
	var body: some View {
		Form {
			Section("New Manga") {
				HStack {
					
					TextField("Title", text: $title)
					
					TextField("Vol", value: $volume, format: .number)
						.keyboardType(.numberPad)
					
					MangaStatusPickerComponent(status: $status)
				}
				
				Button("Add") {
					createMangaAndPersist()
				}
			}
			
			Section("New Mangas") {
				
					HStack {
						MangaStatusPickerComponent(status: $status)
					}
					
					Slider(value: $amountOfVolumes, in: 1...100, step: 1) {
						Text("Add Mangas from: 1 to 100")
					} minimumValueLabel: {
						Text("1")
					} maximumValueLabel: {
						Text("100")
					} onEditingChanged: { editing in
						isEditingSlide = editing
					}
					
				
				Button(action: { createMangasAndPersist() }) {
					Text("Add \(amountOfVolumes, format: .number)")
						.foregroundColor(isEditingSlide ? .red : .blue)
				}
			}
		}
		.navigationTitle("Add manga")
		.navigationBarTitleDisplayMode(.inline)
	}
	
	func createNewManga(volume: Int16, status: String) -> Manga {
		let manga = Manga(context: moc)
		manga.id = UUID()
		manga.volume = volume
		manga.status = status
		
		collection.addToMangas(manga)
		
		return manga
	}
	
	func createNewMangas(amountOfVolumes: Double, status: String) -> [Manga] {
	 var mangas = [Manga]()

		for newVolume in 1...Int(amountOfVolumes) {
			var newManga = createNewManga(volume: Int16(newVolume), status: status)
			collection.addToMangas(newManga)
			mangas.append(newManga)
		}
		
		return mangas
	}
	
	func createMangaAndPersist() {
		
		createNewManga(volume: Int16(volume), status: statusString)
		
		do {
			if(moc.hasChanges) {
				try moc.save()
			}
		} catch {
			print("Error on create Manga: \(error.localizedDescription)")
		}
		
		dismiss()
	}
	
	func createMangasAndPersist() {
		createNewMangas(amountOfVolumes: amountOfVolumes, status: statusString)
		
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
