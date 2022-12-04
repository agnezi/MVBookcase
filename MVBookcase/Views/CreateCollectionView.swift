//
//
// MVBookcase
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI
import WidgetKit

struct CreateCollectionView: View {
	
	@State private var title = ""
	
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss
	
	public var body: some View {
		Form {
			Section("Title") {
				TextField("Type here", text: $title)
			}
			
			Button("Create") { create() }
		}
		.navigationTitle("Create Collection")
		.navigationBarTitleDisplayMode(.inline)
	}
	
	
	private func create() {
		let collection = Collection(context: moc)
		collection.id = UUID()
		collection.title = title
		do {
			if(moc.hasChanges) {
				try moc.save()
			}
		} catch {
			print("Error trying to create collectino: \(error.localizedDescription)")
		}
		WidgetCenter.shared.reloadTimelines(ofKind: "tkoff0110.MVBookcase.MangasExtension")
		dismiss()
		
	}
}
