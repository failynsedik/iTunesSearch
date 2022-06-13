//
//  FavoritesView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/13/22.
//

import CoreData
import SwiftUI

struct FavoritesView: View {
	@StateObject var searchViewModel: SearchViewModel
	@StateObject var favoritesViewModel: FavoritesViewModel
	
	@FetchRequest(
		entity: FavoriteMedia.entity(),
		sortDescriptors: []
	) var fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>
	
    var body: some View {
		ScrollView {
			ForEach(fetchedFavoriteMediaList) { favoriteMedia in
				let item = favoriteMedia.toMedia()
				
				NavigationLink(destination: MediaDetailView(item: item, isFavorite: isFavorite(item), onTapFavorite: {
					toggleFavorite(item)
				})) {
					SearchItemView(item: item, isFavorite: isFavorite(item), onTapFavorite: {
						toggleFavorite(item)
					})
				}.buttonStyle(PlainButtonStyle())
			}
		}
    }
	
	func toggleFavorite(_ media: Media) {
		if let savedMedia = fetchedFavoriteMediaList.first(where: { $0.id == media.id }) {
			favoritesViewModel.removeFromFavorites(savedMedia)
		} else {
			favoritesViewModel.addToFavorites(media)
		}
	}
	
	func isFavorite(_ media: Media) -> Bool {
		if let _ = fetchedFavoriteMediaList.first(where: { $0.id == media.id }) {
			return true
		} else {
			return false
		}
	}
}
