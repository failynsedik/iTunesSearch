//
//  Media.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/13/22.
//

import Foundation

class Media: Identifiable {
	let id: Int
	let artistName: String
	let trackName: String
	let artworkUrl100: String
	/// Currency + Price
	let trackPrice: String
	let primaryGenreName: String
	let shortDescription: String
	let longDescription: String
	
	init(id: Int, artistName: String, trackName: String, artworkUrl100: String, trackPrice: String, primaryGenreName: String, shortDescription: String, longDescription: String) {
		self.id = id
		self.artistName = artistName
		self.trackName = trackName
		self.artworkUrl100 = artworkUrl100
		self.trackPrice = trackPrice
		self.primaryGenreName = primaryGenreName
		self.shortDescription = shortDescription
		self.longDescription = longDescription
	}
}

// MARK: - Equatable

extension Media: Equatable {
	static func == (lhs: Media, rhs: Media) -> Bool {
		return lhs.id == rhs.id
	}
}
