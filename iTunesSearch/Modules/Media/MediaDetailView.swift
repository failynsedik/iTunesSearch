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
					SearchItemView(item: item)
					Spacer()
					FavoriteButton(isSet: $isFavorite, onTapFavorite: onTapFavorite)
						.padding()
				}
				Divider().padding(.horizontal)
				Text(item.longDescription).padding()
				Spacer()
			}
			
		}
		.navigationBarTitleDisplayMode(.inline)
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
