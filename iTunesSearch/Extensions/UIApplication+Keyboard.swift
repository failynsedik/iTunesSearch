//
//  UIApplication+Keyboard.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

/// `UIApplication` extension for keyboard-related helper methods.
extension UIApplication {
	
	/// Resigns the keyboard.
	///
	/// Used for resigning the keyboard when pressing the cancel button in a search bar based on [this](https://stackoverflow.com/a/58473985/3687284) solution.
	/// - Parameter force: Set `true` to resign the keyboard.
	func endEditing(_ force: Bool) {
		let scenes = UIApplication.shared.connectedScenes
		let windowScene = scenes.first as? UIWindowScene
		let window = windowScene?.windows.first
		window?.endEditing(force)
	}
}


struct ResignKeyboardOnDragGesture: ViewModifier {
	var gesture = DragGesture().onChanged{_ in
		UIApplication.shared.endEditing(true)
	}
	
	func body(content: Content) -> some View {
		content.gesture(gesture)
	}
}

extension View {
	func resignKeyboardOnDragGesture() -> some View {
		return modifier(ResignKeyboardOnDragGesture())
	}
}
