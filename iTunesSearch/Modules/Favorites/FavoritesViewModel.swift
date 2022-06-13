//
//  FavoritesViewModel.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/14/22.
//

//import CoreData
import SwiftUI

class FavoritesViewModel: ObservableObject {
	
	var managedObjectContext = PersistenceManager.shared.container.viewContext
	
	func bindingForMediaId(id: Int, from fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>) -> Binding<Bool> {
		if let _ = fetchedFavoriteMediaList.first(where: { Int($0.id) == id }) {
			return .constant(true)
		} else {
			return .constant(false)
		}
	}
	
	func isFavorite(id: Int, comparedWith fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>) -> Bool {
		if let _ = fetchedFavoriteMediaList.first(where: { $0.id == id }) {
			return true
		} else {
			return false
		}
	}
	
	func toggleFavorite(_ media: Media, on fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>) {
		if let savedMedia = fetchedFavoriteMediaList.first(where: { $0.id == media.id }) {
			removeFromFavorites(savedMedia)
		} else {
			addToFavorites(media)
		}
	}
	
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
		PersistenceManager.shared.save()
	}
	
	func removeFromFavorites(_ media: FavoriteMedia) {
		managedObjectContext.delete(media)
		PersistenceManager.shared.save()
	}
}
