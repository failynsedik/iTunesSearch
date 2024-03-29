//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import ServiceKit
import SwiftUI

class SearchViewModel: ObservableObject {
	// MARK: - Enums
	
	enum State {
		case idle
		case loading
		case loadingMore
		case failed(Error)
		case loaded([Media])
		case empty
		case ended
	}
	
	// MARK: - Properties
	
	// MARK: Published
	@Published var searchTerm = ""
	@Published var previousSearchTerm = ""
	@Published var searchResults: [Media] = []
	@Published private(set) var state = State.idle
	
	// MARK: Mutable
	private var offset = 0
	
	
}

// MARK: - Search

extension SearchViewModel {
	func search() {
		// If the search term is empty, do not call the API and
		// remember to clear up previous search results if any.
		guard !searchTerm.isEmpty || !searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
			resetSearch()
			state = .idle
			return
		}
		
		if previousSearchTerm != searchTerm {
			// Clear existing results since it's not the same
			resetSearch()
		}
		
		// Set the previous search term
		previousSearchTerm = searchTerm
		
		state = searchResults.isEmpty ? .loading : .loadingMore
		
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
	
	/// Loads more content only if needed. The loading is triggered when the current last result becomes
	/// visible to the user.
	func loadMoreContentIfNeeded(currentItem item: Media) {
		let thresholdIndex = searchResults.index(searchResults.endIndex, offsetBy: -1)
		if searchResults.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
			search()
		}
	}
	
	private func handleSearchResult(_ result: Result<SearchResponse, Error>) {
		switch result {
		case .success(let response):
			if !response.results.isEmpty {
				for newSearchResult in response.results {
					// Format the data model to handle any nil values
					let domainModel = formatDataModel(newSearchResult)
					
					// Prevent duplicates (by id)
					if !searchResults.contains(domainModel) {
						searchResults.append(domainModel)
					}
				}
				
				offset += response.results.count
				state = .loaded(searchResults)
			} else {
				if offset == 0 {
					// If there are no search results and this is only the
					// first search, then show empty instead.
					state = .empty
				} else {
					// If subsequent results are empty, end searching.
					state = .ended
				}
			}
			
		case .failure(let error):
			resetSearch()
			state = .failed(error)
		}
	}
	
	private func resetSearch() {
		offset = 0
		searchResults.removeAll()
	}
}

// MARK: - Parser

extension SearchViewModel {
	
	/// Formats the data model to the domain model.
	func formatDataModel(_ model: MediaResponse) -> Media {
		// The default values can be improved, but at this stage, keeping
		// it as follows.
		
		/// AUD by default since the API call uses "au" as the country
		let currency = model.currency ?? "AUD"
		let trackPrice = String(format: "%.2f", model.trackPrice ?? 0.00)
		
		let media = Media(
			id: model.id,
			artistName: model.artistName ?? "N/A",
			trackName: model.trackName ?? "N/A",
			artworkUrl100: model.artworkUrl100 ?? "", // Keeping it empty will trigger the placeholder
			trackPrice: "\(currency) \(trackPrice)",
			primaryGenreName: model.primaryGenreName ?? "N/A",
			shortDescription: model.shortDescription ?? "N/A",
			longDescription: model.longDescription ?? "N/A"
		)
		
		return media
	}
}
