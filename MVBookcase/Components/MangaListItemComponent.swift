//
//
// MVBookcase
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct MangaListItemComponent: View {
	
	@ObservedObject var manga: Manga
	
	@Environment(\.managedObjectContext) var moc
	
	@State private var showEditMangaSheet = false
	
	var body: some View {
		HStack {
			Text(manga.wrappedVolume, format: .number)
				.fontWeight(.bold)
				.font(.largeTitle)
		}
		.foregroundColor(textColor(status: manga.wrappedStatus))
		.swipeActions(edge: .trailing, allowsFullSwipe: false) {
			Button(action: {remove(manga)}) {
				Label("Delete", systemImage: "trash.circle.fill")
			}
			.tint(.red)
			Button(action: {showEditMangaSheet.toggle()}) {
				Label("Edit", systemImage: "pencil.circle.fill")
			}
			.tint(.green)
		}
		.swipeActions(edge: .leading, allowsFullSwipe: false) {
			Button(action: {changeStatus(of: manga)}) {
				Label("Change", systemImage: "arrow.left.arrow.right")
					.foregroundColor(.black)
			}
		}

		.sheet(isPresented: $showEditMangaSheet) {
			EditMangaView(manga: manga)
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
	
	func remove(_ manga: Manga) {
		do {
			moc.delete(manga)
			try moc.save()
		} catch {
			print("Error on delete: \(error.localizedDescription)")
		}
	}
}
