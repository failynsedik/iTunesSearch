//
//  FavoriteButton.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/14/22.
//

import SwiftUI

struct FavoriteButton: View {
	@State var isSet: Bool
	var onTapFavorite: () -> Void
	
	var body: some View {
		Button {
			isSet.toggle()
			onTapFavorite()
		} label: {
			Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
				.labelStyle(.iconOnly)
				.foregroundColor(isSet ? .yellow : .gray)
		}
	}
}
