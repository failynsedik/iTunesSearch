//
//  SearchListView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchListView: View {
	var searchResults: [Media]
	
    var body: some View {
		ScrollView {
			LazyVStack(alignment: .leading) {
				ForEach(searchResults) { item in
					SearchItemView(item: item)
				}
			}
		}
		.resignKeyboardOnDragGesture()
	}
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
		SearchListView(searchResults: [
			SampleData().searchResponse.results[0],
			SampleData().searchResponse.results[1],
			SampleData().searchResponse.results[2],
			SampleData().searchResponse.results[3],
			SampleData().searchResponse.results[4],
		])
    }
}
