//
//  SearchItemView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchItemView: View {
	var item: Media
	
	var body: some View {
		HStack(alignment: .top, spacing: 16) {
			AsyncImage(url: URL(string: item.artworkUrl100 ?? "")) { image in
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
				Text("\(item.currency) \(item.trackPrice, specifier: "%.2f")")
					.foregroundColor(.accentColor)
			}
			
			Spacer()
		}
		.padding()
	}
}

struct SearchItemView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			SearchItemView(item: SampleData().searchResponse.results[0])
			SearchItemView(item: SampleData().searchResponse.results[1])
		}
		.previewLayout(.fixed(width: 350, height: 120))
	}
}
