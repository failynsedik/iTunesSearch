//
//  Media.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import Foundation

class Media: Codable, Identifiable {
	let id: Int
	let kind: Kind
	let artistName: String
	let trackName: String
	let artworkUrl100: String?
	let trackPrice: Double
	let currency: String
	let primaryGenreName: String
	let shortDescription: String?
	let longDescription: String?
	
	enum CodingKeys: String, CodingKey {
		case id = "trackId"
		case kind
		case artistName
		case trackName
		case artworkUrl100
		case trackPrice
		case currency
		case primaryGenreName
		case shortDescription
		case longDescription
	}
	
	init(id: Int, kind: Kind, artistName: String, trackName: String, artworkUrl100: String?, trackPrice: Double, currency: String, primaryGenreName: String, shortDescription: String?, longDescription: String?) {
		self.id = id
		self.kind = kind
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
