//
//  CollectionsView.swift
//  MVBookcase
//
//  Created by Jonas Agnezi on 28/08/22.
//

import SwiftUI

struct CollectionsView: View {
	
	private let collections = ["Mangas", "Books"]
	
	public var body: some View {
		NavigationView {
			List(collections, id:\.self) { collection in
				switch collection {
				case "Mangas": NavigationLink(collection, destination: CollectionsOfMangasView())
				case "Books": NavigationLink(collection, destination: CollectionsOfMangasView())
				default: NavigationLink(collection, destination: CollectionsOfMangasView())
				}
			}
			.navigationTitle("Collections")
			.navigationBarBackButtonHidden(true)
			.toolbar {
				NavigationLink("Create", destination: CreateCollectionView())
			}
		}
	}
}

struct Collections_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			CollectionsView()
		}
	}
}
