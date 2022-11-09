//
//  MangasCollectionView.swift
//  MVBookcase
//
//  Created by Jonas Agnezi on 28/08/22.
//

import SwiftUI

struct MangasCollectionView: View {
    
	
	var body: some View {
			NavigationView {
				List(MangaModel.MangasExample) { manga in
					Text(manga.title)
						.foregroundColor(manga.status == .missing ? .red : .primary)
				}
				.navigationTitle("Naruto")
			}
		}
}

struct MangasCollection_Previews: PreviewProvider {
    static var previews: some View {
			NavigationView{
        MangasCollectionView()
			}
    }
}
