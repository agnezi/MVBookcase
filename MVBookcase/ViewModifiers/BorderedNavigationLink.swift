//
// MVBookcase
// Created by: itsjagnezi on 04/12/22
// Copyright (c) today and beyond
//

import SwiftUI

struct BorderedNavigationLink: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(4)
			.overlay(
				RoundedRectangle(cornerRadius: 4)
					.stroke(Color.blue, lineWidth: 2)
			)
	}
}


extension NavigationLink {
	func borderedStyle() -> some View {
		modifier(BorderedNavigationLink())
	}
}
