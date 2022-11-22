//
//  MVBookcaseApp.swift
//  MVBookcase
//
//  Created by itsjagnezi on 28/08/22.
//

import SwiftUI

@main
struct MVBookcaseApp: App {
	@StateObject private var dataController = DataController()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
						.environment(\.managedObjectContext, dataController.container.viewContext)
						.preferredColorScheme(.dark)
        }
    }
}
