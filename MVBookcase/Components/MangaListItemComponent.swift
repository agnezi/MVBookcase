//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct MangaListItemComponent: View {
	
	@ObservedObject var manga: Manga
	
	var body: some View {
		HStack {
			Text(manga.wrappedVolume, format: .number)
				.fontWeight(.bold)
				.font(.largeTitle)
			VStack {
				Text(manga.wrappedTitle)
			}
		}
		.foregroundColor(textColor(status: manga.wrappedStatus))
		.swipeActions(edge: .trailing) {
			Button("Edit") {
				
			}
			Button("Change") {
				changeStatus(of: manga)
			}
			Button("Delete") {
				
			}
		}
	}
	
	func textColor(status: String) -> Color {
		switch status {
		case "missing": return Color.red
		case "bought": return Color.white
		case "delivery": return Color.yellow
			
		default: return Color.red
		}
	}
	
	func changeStatus(of manga: Manga) {
		if manga.wrappedStatus == "missing" {
			manga.status = "delivery"
			try? moc.save()
			return
		}
		
		if manga.wrappedStatus == "delivery" {
			manga.status = "bought"
			try? moc.save()
			return
		}
		
		if manga.wrappedStatus == "bought" {
			manga.status = "missing"
			try? moc.save()
			return
		}
	}
}

struct MangaListItem_Previews: PreviewProvider {
	static var previews: some View {
		MangaListItem()
	}
}
