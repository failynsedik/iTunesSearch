//
//  SearchView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchView: View {
	@ObservedObject private var viewModel = SearchViewModel()
	
	var body: some View {
		VStack {
			SearchBarView(text: $viewModel.searchTerm, onSearch: {
				viewModel.search()
			})
			
			Spacer()
			
			ZStack {
				switch viewModel.state {
				case .idle:
					Text("Start searching...")
					
				case .loading:
					ProgressView()
					
				case .failed(let error):
					Text(error.localizedDescription)
					
				case .empty:
					Text("Uh Oh! No search results found!")
					
				case .loadingMore, .loaded, .ended:
					// Handle these states inside SearchListView
					SearchListView(searchViewModel: viewModel)
				}
			}
			
			Spacer()
		}
	}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
