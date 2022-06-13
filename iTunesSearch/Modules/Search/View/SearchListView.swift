//
//  SearchListView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import CoreData
import SwiftUI

struct SearchListView: View {
	@StateObject var searchViewModel: SearchViewModel
	@StateObject var favoritesViewModel: FavoritesViewModel
	
	@FetchRequest(
		entity: FavoriteMedia.entity(),
		sortDescriptors: []
	) var fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>
	
	var body: some View {
		ScrollView {
			LazyVStack(alignment: .leading) {
				// FIXME: Detail to master favorite
				
				// Item
				ForEach(searchViewModel.searchResults) { item in
					NavigationLink(destination: MediaDetailView(item: item, isFavorite: isFavorite(item), onTapFavorite: {
						toggleFavorite(item)
					})) {
						SearchItemView(item: item, isFavorite: item.isFavorite, onTapFavorite: {
							toggleFavorite(item)
						})
						.onAppear {
							searchViewModel.loadMoreContentIfNeeded(currentItem: item)
						}
					}
					.buttonStyle(PlainButtonStyle())
				}
				
				// Loading More State
				if case .loadingMore = searchViewModel.state {
					HStack {
						Spacer()
						ProgressView()
						Spacer()
					}
				}
				
				// No more search results
				if case .ended = searchViewModel.state {
					HStack {
						Spacer()
						Text("You've reached the end of the results! 🎉")
							.font(.caption)
						Spacer()
					}
				}
			}
		}
		.resignKeyboardOnDragGesture()
	}
	
	func toggleFavorite(_ media: Media) {
		if let savedMedia = fetchedFavoriteMediaList.first(where: { $0.id == media.id }) {
			searchViewModel.searchResults.first(where: { $0.id == media.id })?.isFavorite = false
			searchViewModel.searchResults = searchViewModel.searchResults
			favoritesViewModel.removeFromFavorites(savedMedia)
		} else {
			searchViewModel.searchResults.first(where: { $0.id == media.id })?.isFavorite = true
			searchViewModel.searchResults = searchViewModel.searchResults
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
