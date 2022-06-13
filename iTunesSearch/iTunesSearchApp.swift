//
//  iTunesSearchApp.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

@main
struct iTunesSearchApp: App {
	@Environment(\.scenePhase) var scenePhase
	let persistenceManager = PersistenceManager.shared
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.managedObjectContext, persistenceManager.container.viewContext)
        }
		.onChange(of: scenePhase) { _ in
			persistenceManager.save()
		}
    }
}
