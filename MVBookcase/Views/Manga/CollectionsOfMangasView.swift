//
//  CollectionsOfMangasView.swift
//  MVBookcase
//
//  Created by itsjagnezi on 28/08/22.
//

import SwiftUI

struct CollectionsOfMangasView: View {
	
	@FetchRequest(sortDescriptors: []) var collections: FetchedResults<Collection>
	@Environment(\.managedObjectContext) var moc
	
	var body: some View {
		VStack {
			List(collections) { collection in
				NavigationLink(
					collection.wrappedTitle
				) {
					CollectionOfMangasView(collection: collection)
				}
				.swipeActions(edge: .trailing, allowsFullSwipe: true) {
					Button(action: {
						delete(collection)
					}) {
						Label("Delete", systemImage: "trash.circle.fill")
					}
				}
				.tint(.red)
			}
		}
		.navigationTitle("Collections of Mangas")
		.toolbar {
			NavigationLink("Create", destination: CreateCollectionView())
		}
	}
	
	func delete(_ collection: Collection) {
		moc.delete(collection)
		
		do {
			if(moc.hasChanges) {
				try moc.save()
			}
		} catch {
			print("Error trying to save after delete: \(error.localizedDescription)")
		}
	}
}

struct CollectionsOfMangasView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			CollectionsOfMangasView()
		}
	}
}
