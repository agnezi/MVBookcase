//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct CollectionOfMangasView: View {
	
	@ObservedObject var collection: Collection
	
	@Environment(\.managedObjectContext) var moc
	
	var body: some View {
		List(collection.mangasArr) { manga in
			MangaListItemComponent(manga: manga)
		}
		.navigationTitle(collection.wrappedTitle)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			NavigationLink("Add", destination: AddMangaView(collection: collection))
		}
	}
}
