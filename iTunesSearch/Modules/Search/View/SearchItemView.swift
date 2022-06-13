//
//  SearchItemView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchItemView: View {
	@State var item: Media
	@State var isFavorite: Bool
	var onTapFavorite: () -> Void
	
	var body: some View {
		HStack(alignment: .top, spacing: 16) {
			AsyncImage(url: URL(string: item.artworkUrl100)) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: 100)
			} placeholder: {
				ImagePlaceholderView()
			}
			
			VStack(alignment: .leading, spacing: 8) {
				Text(item.trackName)
					.font(.title2)
				Text(item.primaryGenreName)
					.font(.caption)
					.foregroundColor(.gray)
				Text(item.trackPrice)
					.foregroundColor(.accentColor)
			}
			
			Spacer()
			
			FavoriteButton(isSet: isFavorite, onTapFavorite: onTapFavorite)
		}
		.padding()
	}
}

