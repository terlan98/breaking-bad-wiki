//
//  CharacterList.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI

// MARK: - CharacterList

/// A view that shows the list of all `Character`s in the Breaking Bad TV series
struct CharacterList: View {
    /// The model containing the characters
    @EnvironmentObject var characterListVM: CharacterListViewModel
    
    /// The text that the user has typed to the search bar
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach($characterListVM.characters, id: \.char_id) { character in
                    NavigationLink(destination: CharacterDetail(character: character))
                    {
                        CharacterCell(character: character)
                    }
                    .listRowBackground(Color.green.opacity(0.3))
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Characters")
            .backgroundViewModifier()
        }
    }
    
    init() {
            // Changes the font of the navigation title
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Quicksand-Bold", size: 36)!]
        }
}

// MARK: - CharacterList Previews
struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList().environmentObject(CharacterListViewModel.mock)
    }
}
