//
//  SearchBarView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import Combine
import SwiftUI

struct SearchBarView: View {
	
	/// This holds the search query.
	@Binding var text: String
	
	/// Completion after user ended typing after the debounce. Default debounce
	/// is 0.5 seconds. See `DebounceObject` for more details.
	var onSearch: () -> Void
	
	@StateObject private var debounceObject = DebounceObject()
	@State private var showCancelButton: Bool = false
	
	var body: some View {
		HStack {
			HStack {
				Image(systemName: "magnifyingglass")
				TextField("Search", text: $debounceObject.text, onEditingChanged: { _ in
					showCancelButton = true
				})
				.onChange(of: debounceObject.debouncedText, perform: { newValue in
					text = newValue
					onSearch()
				})
				.foregroundColor(.primary)
				
				Button(action: {
					debounceObject.text = ""
				}) {
					Image(systemName: "xmark.circle.fill")
						.opacity(debounceObject.text == "" ? 0 : 1)
				}
			}
			.padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
			.foregroundColor(.secondary)
			.background(Color(.secondarySystemBackground))
			.cornerRadius(10.0)
			
			// Show if editing changed and hide after tapping the button
			if showCancelButton  {
				Button("Cancel") {
					UIApplication.shared.endEditing(true)
					debounceObject.text = ""
					showCancelButton = false
				}
				.foregroundColor(Color(.systemBlue))
			}
		}
		.padding(.horizontal)
		.navigationBarHidden(showCancelButton)
	}
}

final class DebounceObject: ObservableObject {
	@Published var text: String = ""
	@Published var debouncedText: String = ""
	private var bag = Set<AnyCancellable>()
	
	public init(delay: TimeInterval = 0.5) {
		$text
			.removeDuplicates()
			.debounce(for: .seconds(delay), scheduler: DispatchQueue.main)
			.sink(receiveValue: { [weak self] value in
				self?.debouncedText = value
			})
			.store(in: &bag)
	}
}

struct SearchBarView_Previews: PreviewProvider {
	@State static var term = "star"
	
	static var previews: some View {
		SearchBarView(text: $term, onSearch: {})
			.previewLayout(.fixed(width: 350, height: 70))
	}
}
