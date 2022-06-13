//
//  PersistenceManager.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/13/22.
//

import CoreData

class PersistenceManager {
	static let shared = PersistenceManager()
	
	static var preview: PersistenceManager = {
		let result = PersistenceManager(inMemory: true)
		let viewContext = result.container.viewContext

		for i in 0..<2 {
			let newItem = FavoriteMedia(context: viewContext)
			newItem.id = Int64(i)
			newItem.trackName = "Track \(i)"
			newItem.trackPrice = "5.99"
			newItem.artistName = "Artist Name"
			newItem.artworkUrl100 = "artwork.jpg"
			newItem.primaryGenreName = "Genre"
			newItem.trackLongDescription = "Some long description"
			newItem.trackShortDescription = "Descrip"
		}
		
		do {
			try viewContext.save()
		} catch {
			// Replace this implementation with code to handle the error appropriately.
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		
		return result
	}()
	
	let container: NSPersistentContainer
	
	init(inMemory: Bool = false) {
		container = NSPersistentContainer(name: "iTunes")
		
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		
		container.loadPersistentStores { [weak self] (storeDescription, error) in
			if let error = error as NSError? {
				/*
				 Typical reasons for an error here include:
				 * The parent directory does not exist, cannot be created, or disallows writing.
				 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
				 * The device is out of space.
				 * The store could not be migrated to the current model version.
				 Check the error message to determine what the actual problem was.
				 */
				
				// TODO: Replace this implementation with code to handle the error appropriately.
				fatalError("Unresolved error \(error), \(error.userInfo)")
			} else {
				print("[Persistence] storeDesc", storeDescription)
				
				self?.container.viewContext.automaticallyMergesChangesFromParent = true
				self?.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
			}
		}
	}
	
	func save() {
		let context = container.viewContext
		
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				let nserror = error as NSError
				print(nserror)
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
}
