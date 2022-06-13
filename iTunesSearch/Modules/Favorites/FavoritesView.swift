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
	
	// MARK: - Core Data
	
	@FetchRequest(
		entity: FavoriteMedia.entity(),
		sortDescriptors: []
	) var fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>
	
	// MARK: - Views
	
    var body: some View {
		ScrollView {
			ForEach(fetchedFavoriteMediaList) { favoriteMedia in
				let item = favoriteMedia.toMedia()
				
				NavigationLink(destination: mediaDetailView(with: item)) {
					HStack(alignment: .top) {
						SearchItemView(item: item)
						
						FavoriteButton(isSet: favoritesViewModel.bindingForMediaId(id: item.id, from: fetchedFavoriteMediaList), onTapFavorite: {
							favoritesViewModel.toggleFavorite(item, on: fetchedFavoriteMediaList)
						})
						.padding()
					}
				}.buttonStyle(PlainButtonStyle())
			}
		}
    }
	
	func mediaDetailView(with item: Media) -> some View {
		MediaDetailView(
			item: item,
			isFavorite: favoritesViewModel.isFavorite(id: item.id, comparedWith: fetchedFavoriteMediaList),
			onTapFavorite: {
				favoritesViewModel.toggleFavorite(item, on: fetchedFavoriteMediaList)
			})
	}
}
