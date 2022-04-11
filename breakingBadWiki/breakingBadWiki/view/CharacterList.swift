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
    
    /// Initializes this view using a `CharacterListViewModel`. Creates a new instance of `CharacterListViewModel` if the parameter is skipped.
    init(characterListVM: CharacterListViewModel? = nil) {
        if let viewModel = characterListVM  {
            _characterListVM = StateObject(wrappedValue: viewModel)
        } else {
            _characterListVM = StateObject(wrappedValue: CharacterListViewModel())
        }
    }
    
    /// The results matching the search string typed by the user
    private var searchResults: [Character] {
        if searchText.isEmpty { // not searching yet, return all
            return characterListVM.characters
        } else {
            return characterListVM.characters.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            if characterListVM.characters.isEmpty { // couldn't fetch, show error
                ErrorView(title: "Couldn't fetch data", message: "Please check your network connection")
                    .navigationTitle("Characters")
            } // fetched successfully, show data
            else {
                List {
                    ForEach(searchResults, id: \.char_id) { character in
                        NavigationLink(destination: CharacterDetail(character: Binding.constant(character)))
                        {
                            CharacterCell(character: Binding.constant(character))
                        }
                        .listRowBackground(Color("GreenBackgroundColor"))
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Characters")
                .backgroundViewModifier()
            }
        }
        .task {
            await characterListVM.fetchData()
        }
        .onAppear(){
            // Changes the font of the navigation title
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: FontNames.DefaultBold.rawValue, size: 36)!]
        }
    }
}

// MARK: - CharacterList Previews
struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(characterListVM: CharacterListViewModel.mock)
    }
}
