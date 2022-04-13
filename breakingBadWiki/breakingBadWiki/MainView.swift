//
//  ContentView.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI

// MARK: - MainView
/// The entry point of the app
struct MainView: View {
    
    var body: some View {
        TabView {
            CharacterList()
                .tabItem {
                    Label("Characters", systemImage: "person.crop.rectangle.stack.fill")
                }
            FavoriteCarousel()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
        .backgroundViewModifier()
    }
}

// MARK: - MainView Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            MainView().colorScheme(colorScheme)
        }
    }
}
