//
//  ImagePlaceholderView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct ImagePlaceholderView: View {
    var body: some View {
		ZStack {
			Rectangle().fill(.gray)
			Image(systemName: "photo.on.rectangle")
				.foregroundColor(.white)
		}
		.frame(width: 100, height: 130)
    }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView()
			.previewLayout(.fixed(width: 100, height: 130))
    }
}
