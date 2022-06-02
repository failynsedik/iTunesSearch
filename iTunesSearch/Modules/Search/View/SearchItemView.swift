//
//  SearchItemView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchItemView: View {
	var item: Media
	@State private var image: UIImage?
	
	var body: some View {
		HStack(alignment: .top, spacing: 16) {
			Rectangle()
				.fill(.gray)
				.frame(width: 80, height: 100)
			
			VStack(alignment: .leading, spacing: 8) {
				Text(item.trackName)
					.font(.title2)
				Text(item.primaryGenreName.rawValue)
					.font(.caption)
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
