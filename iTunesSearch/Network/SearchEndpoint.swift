//
//  SearchEndpoint.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import ServiceKit

/// NOTE: Should hold endpoints related to iTunes searches.
enum SearchEndpoint {
	case getMovies(term: String, offset: Int)
}

extension SearchEndpoint: EndpointProtocol {
	var host: String { "itunes.apple.com" }
	
	var path: String {
		switch self {
		case .getMovies: return "/search"
		}
	}
	
	var httpMethod: EndpointRequestMethod {
		switch self {
		case .getMovies: return .get
		}
	}
	
	var parameters: [String: Any] {
		switch self {
		case let .getMovies(term, offset):
			let parameters: [String: Any] = [
				"term": term,
				"offset": offset,
				"limit": 10,
				"country": "au", // Default as per requirement
				"media": "movie" // Default as per requirement
			]
			return parameters
		}
	}
}
