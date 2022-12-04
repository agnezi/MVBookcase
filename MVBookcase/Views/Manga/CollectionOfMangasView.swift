//
//
// MVBookcase
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct CollectionOfMangasView: View {
	@State private var listType = VolumeStatus.all
	
	@ObservedObject var collection: Collection
	
	@Environment(\.managedObjectContext) var moc
	
	
	
	var filteredListOfMangas: [Manga] {
		switch listType {
		case .all:
			return collection.mangasArr
			
		case .missing:
			return collection.mangasArr.filter { $0.status == "missing" }
			
		case .bought:
			return collection.mangasArr.filter { $0.status == "bought" }
			
		case .delivery:
			return collection.mangasArr.filter { $0.status == "delivery" }
			
		}
	}
	
	var body: some View {
		VStack {
			
			Text("Filter by:")
				.font(.headline)
			
			Picker("", selection: $listType) {
				Text("All").tag(VolumeStatus.all)
				Text("Missing").tag(VolumeStatus.missing)
				Text("Bought").tag(VolumeStatus.bought)
				Text("Delivery").tag(VolumeStatus.delivery)
			}
			.pickerStyle(.segmented)
			
			
			List(filteredListOfMangas) { manga in
				MangaListItemComponent(manga: manga)
			}
		
			
			HStack(spacing: 24) {
				NavigationLink {
					AddMangaView(collection: collection)
				} label: {
					Label("Add One", systemImage: "plus")
				}
				.borderedStyle()
				
				NavigationLink {
					AddMangaView(collection: collection)
				} label: {
					Label("Add Many", systemImage: "list.bullet")
				}
				.borderedStyle()
			}
			
		}
		.padding([.top], 30)
		.navigationTitle(collection.wrappedTitle)
		.navigationBarTitleDisplayMode(.inline)
	}
}
