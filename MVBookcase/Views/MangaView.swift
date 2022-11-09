//
//  MangaView.swift
//  MVBookcase
//
//  Created by Jonas Agnezi on 05/09/22.
//

import SwiftUI

struct MangaView: View {
	
	@State private var animationAmount = 0.0
	@State private var isFront = true
	
	
	var body: some View {
		ZStack {
			Color.gray
			
			ZStack {
				Rectangle()
					.fill(.white)
					.frame(width: 300, height: 500)
					.clipShape(RoundedRectangle(cornerRadius: 20))
				
				Rectangle()
					.fill(.black)
					.frame(width: 250, height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 20))
					.offset(y: -120)
				
				VStack(spacing: 5) {
					Text("Testetestestetestestestes")
					Text("testestestestestsstestes")
				}
				.offset(y: 50)
				.foregroundColor(.black)
				.rotation3DEffect(.degrees(-180), axis: (x:0, y:1, z:0))
				
			}
			.opacity(!isFront ? 1 : 0)
			.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
			.onTapGesture {
				withAnimation(.easeInOut(duration: 1)) {
					animationAmount -= 180
					isFront = true
				}
				
			}
			
			ZStack {
				Rectangle()
					.fill(.white)
					.frame(width: 300, height: 500)
					.clipShape(RoundedRectangle(cornerRadius: 20))
				
				Rectangle()
					.fill(.black)
					.frame(width: 150, height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 20))
				
				VStack(spacing: 30) {
					Text("Title")
					Text("SubTitle")
				}
				.offset(y: -200)
				.foregroundColor(.black)
				
				HStack {
					Text("Vol 1")
					Spacer()
					Text("Satoshi")
				}
				.offset(y: 200)
				.padding(10)
				.frame(maxWidth: 300)
				.foregroundColor(.black)
			}
			.opacity(isFront ? 1 : 0)
			.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
			.onTapGesture {
				withAnimation(.easeInOut(duration: 1)) {
					animationAmount += 180
					isFront = false
				}
				
			}
		}
	}
}

struct MangaView_Previews: PreviewProvider {
	static var previews: some View {
		MangaView()
	}
}
