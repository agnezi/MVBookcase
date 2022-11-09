//
//  CollectionsView.swift
//  MVBookcase
//
//  Created by Jonas Agnezi on 28/08/22.
//

import SwiftUI

struct CollectionsView: View {
    var body: some View {
			NavigationView {
				List {
					Section("Mangas") {
						Text("Naruto")
					}
					
					Section("Books by Author") {
						Text("Yuaval Noah Harari")
					}
				}
				.navigationTitle("Collections")
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
