//
//  FavoriteMedia+Parser.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/14/22.
//

import Foundation

extension FavoriteMedia {
	func toMedia() -> Media {
		Media(
			id: Int(id),
			artistName: artistName ?? "",
			trackName: trackName ?? "",
			artworkUrl100: artworkUrl100 ?? "",
			trackPrice: trackPrice ?? "",
			primaryGenreName: primaryGenreName ?? "",
			shortDescription: trackShortDescription ?? "",
			longDescription: trackLongDescription ?? ""
		)
	}
}
