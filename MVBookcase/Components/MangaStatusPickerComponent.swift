//
//
// CupcakeCorner
// Created by: itsjagnezi on 21/10/22
// Copyright (c) today and beyond
//


import SwiftUI

struct MangaStatusPickerComponent: View {
	
	@Binding var status: VolumeStatus
	
	var body: some View {
		VStack {			
			Picker("", selection: $status) {
				Text("Bought").tag(VolumeStatus.bought)
				Text("Missing").tag(VolumeStatus.missing)
				Text("Delivery").tag(VolumeStatus.delivery)
			}
		}
	}
}

struct MMangaStatusPickerComponent_Previews: PreviewProvider {
	static var previews: some View {
		MangaStatusPickerComponent(status: .constant(VolumeStatus.bought))
	}
}
