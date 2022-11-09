//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct EditMangaView: View {
	@ObservedObject var manga: Manga
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	@State private var title = ""
	@State private var volume = 0
	@State private var status = VolumeStatus.bought
	
	var body: some View {
		Form {
			Section("Edit Manga") {
				
				HStack {
					TextField("Vol", value: $volume, format: .number)
						.keyboardType(.numberPad)
					
					Picker("", selection: $status) {
						Text("Bought").tag(VolumeStatus.bought)
						Text("Missing").tag(VolumeStatus.missing)
						Text("Delivery").tag(VolumeStatus.delivery)
					}
				}
				
				Button("Create") {
					update()
				}
			}
		}
	}
	
	init(manga: Manga) {
		_title = State(initialValue: manga.wrappedTitle)
		_volume = State(initialValue: manga.wrappedVolume)
		
		var mangaStatus = VolumeStatus.bought
		
		if manga.wrappedStatus == "bought" {
			mangaStatus = VolumeStatus.bought
		} else if manga.wrappedStatus == "missing" {
			mangaStatus = VolumeStatus.missing
		} else {
			mangaStatus = VolumeStatus.delivery
		}
		
		
		_status = State(initialValue: mangaStatus)
		
		self.manga = manga
	}
	
	func update() {
		
		var statusString: String {
			switch status {
			case .bought: return "bought"
			case .missing: return "missing"
			case .delivery: return "delivery"
			}
		}
		
		manga.id = UUID()
		manga.volume = Int16(volume)
		manga.status = statusString
		
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
