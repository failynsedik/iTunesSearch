//
//  MediaDetailView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/13/22.
//

import SwiftUI

struct MediaDetailView: View {
	@State var item: Media
	@State var isFavorite: Bool
	var onTapFavorite: () -> Void
	
    var body: some View {
		ScrollView {
			VStack {
				HStack(alignment: .top) {
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
				Divider()
				Text(item.longDescription)
				Spacer()
			}
			Spacer()
		}
		.padding()
    }
}

struct MediaDetailVieww_Previews: PreviewProvider {
	@State static var isFavorite = true
	
	static var previews: some View {
		let viewModel = SearchViewModel()
		let item0 = viewModel.formatDataModel(SampleData().searchResponse.results[0])
		
		MediaDetailView(item: item0, isFavorite: true) {
			print("Tapped!")
		}
	}
}
