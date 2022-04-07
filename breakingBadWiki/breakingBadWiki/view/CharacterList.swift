//
//  CharacterList.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI
import OSLog

// MARK: - CharacterList
/// A view that shows the list of all `Character`s in the Breaking Bad TV series
struct CharacterList: View {
    /// The model containing the characters
    @StateObject var characterListVM: CharacterListViewModel
    
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
        .task {
            await characterListVM.fetchData()
        }
        .onAppear(){
            // Changes the font of the navigation title
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: FontNames.DefaultBold.rawValue, size: 36)!]
        }
    }
    
    init(characterListVM: CharacterListViewModel? = nil) {
        if let viewModel = characterListVM  {
            _characterListVM = StateObject(wrappedValue: viewModel)
        } else {
            _characterListVM = StateObject(wrappedValue: CharacterListViewModel())
        }
    }
}

// MARK: - CharacterList Previews
struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(characterListVM: CharacterListViewModel.mock)
    }
}
