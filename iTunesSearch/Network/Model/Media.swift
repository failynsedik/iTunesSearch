//
//  Media.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import Foundation

class Media: Codable, Identifiable {
	let id: Int
	let wrapperType: String
	let kind: Kind
	let collectionID: Int?
	let artistName: String
	let collectionName: String?
	let trackName: String
	let collectionCensoredName: String?
	let trackCensoredName: String
	let collectionArtistID: Int?
	let collectionArtistViewURL, collectionViewURL: String?
	let trackViewURL: String
	let previewURL: String
	let artworkUrl30, artworkUrl60, artworkUrl100: String
	let collectionPrice, trackPrice: Double
	let trackRentalPrice: Double?
	let collectionHDPrice, trackHDPrice: Double
	let trackHDRentalPrice: Double?
	let releaseDate: String
	let collectionExplicitness: String
	let trackExplicitness: String
	let discCount, discNumber, trackCount, trackNumber: Int?
	let trackTimeMillis: Int
	let country: String
	let currency: String
	let primaryGenreName: PrimaryGenreName
	let contentAdvisoryRating: ContentAdvisoryRating
	let shortDescription: String?
	let longDescription: String
	let hasITunesExtras: Bool?
	
	enum CodingKeys: String, CodingKey {
		case id = "trackId"
		case wrapperType, kind
		case collectionID = "collectionId"
		case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
		case collectionArtistID = "collectionArtistId"
		case collectionArtistViewURL = "collectionArtistViewUrl"
		case collectionViewURL = "collectionViewUrl"
		case trackViewURL = "trackViewUrl"
		case previewURL = "previewUrl"
		case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
		case collectionHDPrice = "collectionHdPrice"
		case trackHDPrice = "trackHdPrice"
		case trackHDRentalPrice = "trackHdRentalPrice"
		case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
	}
	
	init(id: Int, wrapperType: String, kind: Kind, collectionID: Int?, artistName: String, collectionName: String?, trackName: String, collectionCensoredName: String?, trackCensoredName: String, collectionArtistID: Int?, collectionArtistViewURL: String?, collectionViewURL: String?, trackViewURL: String, previewURL: String, artworkUrl30: String, artworkUrl60: String, artworkUrl100: String, collectionPrice: Double, trackPrice: Double, trackRentalPrice: Double?, collectionHDPrice: Double, trackHDPrice: Double, trackHDRentalPrice: Double?, releaseDate: String, collectionExplicitness: String, trackExplicitness: String, discCount: Int?, discNumber: Int?, trackCount: Int?, trackNumber: Int?, trackTimeMillis: Int, country: String, currency: String, primaryGenreName: PrimaryGenreName, contentAdvisoryRating: ContentAdvisoryRating, shortDescription: String?, longDescription: String, hasITunesExtras: Bool?) {
		self.id = id
		self.wrapperType = wrapperType
		self.kind = kind
		self.collectionID = collectionID
		self.artistName = artistName
		self.collectionName = collectionName
		self.trackName = trackName
		self.collectionCensoredName = collectionCensoredName
		self.trackCensoredName = trackCensoredName
		self.collectionArtistID = collectionArtistID
		self.collectionArtistViewURL = collectionArtistViewURL
		self.collectionViewURL = collectionViewURL
		self.trackViewURL = trackViewURL
		self.previewURL = previewURL
		self.artworkUrl30 = artworkUrl30
		self.artworkUrl60 = artworkUrl60
		self.artworkUrl100 = artworkUrl100
		self.collectionPrice = collectionPrice
		self.trackPrice = trackPrice
		self.trackRentalPrice = trackRentalPrice
		self.collectionHDPrice = collectionHDPrice
		self.trackHDPrice = trackHDPrice
		self.trackHDRentalPrice = trackHDRentalPrice
		self.releaseDate = releaseDate
		self.collectionExplicitness = collectionExplicitness
		self.trackExplicitness = trackExplicitness
		self.discCount = discCount
		self.discNumber = discNumber
		self.trackCount = trackCount
		self.trackNumber = trackNumber
		self.trackTimeMillis = trackTimeMillis
		self.country = country
		self.currency = currency
		self.primaryGenreName = primaryGenreName
		self.contentAdvisoryRating = contentAdvisoryRating
		self.shortDescription = shortDescription
		self.longDescription = longDescription
		self.hasITunesExtras = hasITunesExtras
	}
}
