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
		ScrollView(.vertical, showsIndicators: true) {
			LazyVStack {
				SearchBarView(text: $viewModel.searchTerm, onSearch: {
					viewModel.search()
				})
				
				switch viewModel.state {
				case .idle:
					// TODO: Center align and maybe consider an image
					Text("Empty")
					
				case .loading:
					// TODO: Center align
					ProgressView()
					
				case .failed(let error):
					// TODO: Center align
					Text(error.localizedDescription)
					
				case .loaded(let searchResults):
					SearchListView(searchResults: searchResults)
				}
			}
		}
	}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
