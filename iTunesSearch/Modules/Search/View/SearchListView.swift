//
//  SearchListView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchListView: View {
	var searchViewModel: SearchViewModel
	
    var body: some View {
		ScrollView {
			LazyVStack(alignment: .leading) {
				ForEach(searchViewModel.searchResults) { item in
					SearchItemView(item: item)
				}
			}
		}
		.resignKeyboardOnDragGesture()
	}
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
		SearchListView(searchViewModel: SearchViewModel())
    }
}
