//
//  SearchResponse.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import Foundation

class SearchResponse: Codable {
	let resultCount: Int
	let results: [MediaResponse]
	
	enum CodingKeys: String, CodingKey {
		case resultCount, results
	}
	
	init(resultCount: Int, results: [MediaResponse]) {
		self.resultCount = resultCount
		self.results = results
	}
}

/*
 Sample Response
 
 {
 "wrapperType":"track",
 "kind":"feature-movie",
 "collectionId":1574727837,
 "trackId":1437031362,
 "artistName":"Bradley Cooper",
 "collectionName":"A Star is Born Collection",
 "trackName":"A Star Is Born (2018)",
 "collectionCensoredName":"A Star is Born Collection",
 "trackCensoredName":"A Star Is Born (2018)",
 "collectionArtistId":199257486,
 "collectionArtistViewUrl":"https://itunes.apple.com/au/artist/warner-bros-entertainment-inc/199257486?uo=4",
 "collectionViewUrl":"https://itunes.apple.com/au/movie/a-star-is-born-2018/id1437031362?uo=4",
 "trackViewUrl":"https://itunes.apple.com/au/movie/a-star-is-born-2018/id1437031362?uo=4",
 "previewUrl":"https://video-ssl.itunes.apple.com/itunes-assets/Video128/v4/6b/cd/60/6bcd60b0-73ce-1a9e-1bf8-d7bcc8d32c10/mzvf_2708740245690387686.640x356.h264lc.U.p.m4v",
 "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/a2/26/fd/a226fd77-c80b-5ee7-e40f-6a0222e1645d/pr_source.jpg/30x30bb.jpg",
 "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/a2/26/fd/a226fd77-c80b-5ee7-e40f-6a0222e1645d/pr_source.jpg/60x60bb.jpg",
 "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Video115/v4/a2/26/fd/a226fd77-c80b-5ee7-e40f-6a0222e1645d/pr_source.jpg/100x100bb.jpg",
 "collectionPrice":7.99,
 "trackPrice":7.99,
 "trackRentalPrice":2.99,
 "collectionHdPrice":7.99,
 "trackHdPrice":7.99,
 "trackHdRentalPrice":2.99,
 "releaseDate":"2018-10-18T07:00:00Z",
 "collectionExplicitness":"notExplicit",
 "trackExplicitness":"notExplicit",
 "discCount":1,
 "discNumber":1,
 "trackCount":3,
 "trackNumber":1,
 "trackTimeMillis":8148723,
 "country":"AUS",
 "currency":"AUD",
 "primaryGenreName":"Romance",
 "contentAdvisoryRating":"M",
 "shortDescription":"Seasoned musician Jackson Maine (Bradley Cooper) discovers—and falls in love with—struggling artist",
 "longDescription":"Seasoned musician Jackson Maine (Bradley Cooper) discovers—and falls in love with—struggling artist Ally (Lady Gaga). She has just about given up on her dream to make it big as a singer… until Jack coaxes her into the spotlight. But even as Ally’s career takes off, the personal side of their relationship is breaking down, as Jack fights an ongoing battle with his own internal demons.",
 "hasITunesExtras":true
 }
 */
