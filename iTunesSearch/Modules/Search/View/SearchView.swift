//
//  SearchView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct SearchView: View {
	var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
			LazyVStack {
				SearchBarView()
				SearchListView(searchResults: [])
			}
		}
	}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
