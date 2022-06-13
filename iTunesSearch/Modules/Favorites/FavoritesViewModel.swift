//
//  FavoritesViewModel.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/14/22.
//

import CoreData
import SwiftUI

class FavoritesViewModel: ObservableObject {
	var managedObjectContext = PersistenceManager.shared.container.viewContext
	
	// If UserDefaults usage gets bigger, create a utility for this.
	let defaults = UserDefaults.standard
	let defaultsKey = "FavoriteMediaList"
	
	// MARK: - Core Data
	
	func addToFavorites(_ media: Media) {
		let favoriteMedia = FavoriteMedia(context: managedObjectContext)
		favoriteMedia.id = Int64(media.id)
		favoriteMedia.trackName = media.trackName
		favoriteMedia.trackPrice = media.trackPrice
		favoriteMedia.artistName = media.artistName
		favoriteMedia.artworkUrl100 = media.artworkUrl100
		favoriteMedia.primaryGenreName = media.primaryGenreName
		favoriteMedia.trackLongDescription = media.longDescription
		favoriteMedia.trackShortDescription = media.shortDescription
		print("will be saved")
		saveToUserDefaults(id: Int(favoriteMedia.id))
		PersistenceManager.shared.save()
	}
	
	func removeFromFavorites(_ media: FavoriteMedia) {
		managedObjectContext.delete(media)
		print("will be removed")
		removeFromUserDefaults(id: Int(media.id))
		PersistenceManager.shared.save()
	}
	
	// MARK: - User Defaults
	
	// NOTE: This approach should be changed.
	func getSavedFavoriteMediaIdList() -> [Int]? {
		if let favoriteMediaIdList = defaults.array(forKey: defaultsKey) as? [Int] {
			return favoriteMediaIdList
		} else {
			return nil
		}
	}

	// NOTE: This approach should be changed.
	func saveToUserDefaults(id: Int) {
		if var favoriteMediaIdList = getSavedFavoriteMediaIdList() {
			favoriteMediaIdList.append(id)
			defaults.setValue(favoriteMediaIdList, forKey: defaultsKey)
		} else {
			defaults.setValue([id], forKey: defaultsKey)
		}
	}
	
	// NOTE: This approach should be changed.
	func removeFromUserDefaults(id: Int) {
		guard var favoriteMediaIdList = getSavedFavoriteMediaIdList() else { return }
		favoriteMediaIdList = favoriteMediaIdList.filter({ $0 != id })
		defaults.setValue(favoriteMediaIdList, forKey: defaultsKey)
	}
}
