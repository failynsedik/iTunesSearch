//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import Foundation
import ServiceKit

class SearchViewModel: ObservableObject {
	enum State {
		case idle
		case loading
		case failed(Error)
		case loaded([Media])
	}
	
	@Published var searchTerm = ""
	@Published var searchResults: [Media] = []
	@Published private(set) var state = State.idle
	
	private var offset = 0
	
	func search() {
		// TODO: Do not search if text is empty or only whitespaces or same as the old search term
		state = .loading
		
		let service = Service(
			endpoint: SearchEndpoint.getMovies(
				term: searchTerm,
				offset: offset
			)
		)
		
		Task {
			let result = await service.request(responseType: SearchResponse.self)
			
			DispatchQueue.main.async {
				self.handleSearchResult(result)
			}
		}
	}
	
	// TODO: Fix issues with result handling
	private func handleSearchResult(_ result: Result<SearchResponse, Error>) {
		switch result {
		case .success(let response):
			searchResults += response.results
			state = .loaded(searchResults)
			
		case .failure(let error):
			state = .failed(error)
		}
	}
}
