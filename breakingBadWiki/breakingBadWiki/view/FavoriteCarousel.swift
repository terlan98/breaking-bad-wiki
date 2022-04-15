//
//  FavoriteList.swift
//  BreakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 11.04.22.
//

import SwiftUI
import ACarousel

// MARK: - FavoriteList
/// A view that shows the list of all `FavoriteCharacter`s selected by the user
struct FavoriteCarousel: View {
    
    /// The model used for handling user's favorite characters
    @EnvironmentObject var favCharacterListVM: FavoriteCharacterListViewModel
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        NavigationView {
            if favCharacterListVM.characters.isEmpty {
                ErrorView(title: "No favorites", message: "Your favorite characters will appear here")
                    .navigationTitle("Favorite Characters")
            }
            else {
                ACarousel(Array(favCharacterListVM.characters), id: \.id, spacing: 20, headspace: 20, sidesScaling: 0.9) { favCharacter in
                    FavoriteCharacterCarouselItem(favCharacter: Binding.constant(favCharacter))
                }
                .buttonStyle(.plain)
                .navigationTitle("Favorite Characters")
            }
        }
        .onAppear(){ // FIXME: For some reason this function gets called only once and its effect on the navigation title size gets overridden
            favCharacterListVM.fetchData()
            
            // Changes the font of the navigation title
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: FontNames.DefaultBold.rawValue, size: 30)!]
        }
    }
}

// MARK: - FavoriteList Previews
struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            FavoriteCarousel()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .environmentObject(FavoriteCharacterListViewModel.mock)
        }
        .backgroundViewModifier()
    }
}
