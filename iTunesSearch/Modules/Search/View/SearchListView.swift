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
	
	// MARK: - Core Data
	
	@FetchRequest(
		entity: FavoriteMedia.entity(),
		sortDescriptors: []
	) var fetchedFavoriteMediaList: FetchedResults<FavoriteMedia>
	
	// MARK: - Views
	
	var body: some View {
		ScrollView {
			LazyVStack(alignment: .leading) {
				itemsView
				
				// Loading More State
				if case .loadingMore = searchViewModel.state { loadingMoreView }
				
				// No more search results
				if case .ended = searchViewModel.state { endOfSearchResultsView }
			}
		}
		.resignKeyboardOnDragGesture()
	}
	
	var itemsView: some View {
		ForEach(searchViewModel.searchResults) { item in
			NavigationLink(destination: mediaDetailView(with: item)) {
				HStack(alignment: .top) {
					SearchItemView(item: item)
						.onAppear {
							searchViewModel.loadMoreContentIfNeeded(currentItem: item)
						}
					
					FavoriteButton(isSet: favoritesViewModel.bindingForMediaId(id: item.id, from: fetchedFavoriteMediaList), onTapFavorite: {
						favoritesViewModel.toggleFavorite(item, on: fetchedFavoriteMediaList)
					})
					.padding()
				}
			}
			.buttonStyle(PlainButtonStyle())
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
	
	var loadingMoreView: some View {
		HStack {
			Spacer()
			ProgressView()
			Spacer()
		}
	}
	
	var endOfSearchResultsView: some View {
		HStack {
			Spacer()
			Text("You've reached the end of the results! 🎉")
				.font(.caption)
			Spacer()
		}
	}
}
