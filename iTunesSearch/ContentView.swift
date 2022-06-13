//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Failyn Kaye Sedik on 6/3/22.
//

import SwiftUI

struct ContentView: View {
	enum TabItem: String {
		case music
		case movies
		case search
		case tones
		case favorites
		
		var title: String {
			return self.rawValue.capitalized
		}
		
		var iconName: String {
			switch self {
			case .music: return "music.note.list"
			case .movies: return "film.fill"
			case .search: return "magnifyingglass"
			case .tones: return "bell.fill"
			case .favorites: return "star"
			}
		}
	}
	
	/// Default selected tab
	@State private var selection = 3
	
    var body: some View {
		TabView(selection: $selection) {
			music
			movies
			search
			tones
			favorites
		}
    }
	
	var music: some View {
		DummyView()
			.tabItem {
				Image(systemName: TabItem.music.iconName)
				Text(TabItem.music.title)
			}
			.tag(1)
	}
	
	var movies: some View {
		DummyView()
			.tabItem {
				Image(systemName: TabItem.movies.iconName)
				Text(TabItem.movies.title)
			}
			.tag(2)
	}
	
	var search: some View {
		NavigationView {
			SearchView()
				.navigationTitle(TabItem.search.title)
		}
		.navigationViewStyle(StackNavigationViewStyle())
		.tabItem {
			Image(systemName: TabItem.search.iconName)
			Text(TabItem.search.title)
		}
		.tag(3)
	}
	
	var tones: some View {
		DummyView()
			.tabItem {
				Image(systemName: TabItem.tones.iconName)
				Text(TabItem.tones.title)
			}
			.tag(4)
	}
	
	var favorites: some View {
		NavigationView {
			FavoritesView(
				searchViewModel: SearchViewModel(),
				favoritesViewModel: FavoritesViewModel()
			)
			.navigationTitle(TabItem.favorites.title)
		}
		.navigationViewStyle(StackNavigationViewStyle())
		.tabItem {
			Image(systemName: TabItem.favorites.iconName)
			Text(TabItem.favorites.title)
		}
		.tag(5)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
