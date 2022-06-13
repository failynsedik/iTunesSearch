//
//  Media.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import Foundation

class MediaResponse: Codable, Identifiable {
	let id: Int
	let artistName: String?
	let trackName: String?
	let artworkUrl100: String?
	let trackPrice: Double?
	let currency: String?
	let primaryGenreName: String?
	let shortDescription: String?
	let longDescription: String?
	
	enum CodingKeys: String, CodingKey {
		case id = "trackId"
		case artistName
		case trackName
		case artworkUrl100
		case trackPrice
		case currency
		case primaryGenreName
		case shortDescription
		case longDescription
	}
	
	init(id: Int, artistName: String?, trackName: String?, artworkUrl100: String?, trackPrice: Double?, currency: String?, primaryGenreName: String?, shortDescription: String?, longDescription: String?) {
		self.id = id
		self.artistName = artistName
		self.trackName = trackName
		self.artworkUrl100 = artworkUrl100
		self.trackPrice = trackPrice
		self.currency = currency
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
