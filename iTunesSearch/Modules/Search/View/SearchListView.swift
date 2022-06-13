//
//  SearchListView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchListView: View {
	@StateObject var searchViewModel: SearchViewModel
	
	var body: some View {
		ScrollView {
			LazyVStack(alignment: .leading) {
				// Item
				ForEach(searchViewModel.searchResults) { item in
					SearchItemView(item: item)
						.onAppear {
							searchViewModel.loadMoreContentIfNeeded(currentItem: item)
						}
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
			.resignKeyboardOnDragGesture()
		}
	}
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
		SearchListView(searchViewModel: SearchViewModel())
    }
}
