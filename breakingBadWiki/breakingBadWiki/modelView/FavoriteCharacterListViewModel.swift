//
//  FavoriteCharacterListViewModel.swift
//  BreakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 11.04.22.
//

import Foundation
import OSLog

// MARK: - FavoriteCharacterListViewModel
class FavoriteCharacterListViewModel: ObservableObject {
    /// The list of `FavoriteCharacter`s selected by the user
    @Published private(set) var characters = Set<FavoriteCharacter>()
    
    /// Logs information about the contents of the view model
    let logger = Logger()
    
    /// A string that represents the key used for storing and retrieving the favorite characters at/from UserDefaults
    let userDefaultsKey = "fav"
    
    /// Fetches user's `FavoriteCharacter`s from UserDefaults
    func fetchData() {
        if let data = UserDefaults.standard.object(forKey: userDefaultsKey) as? Data {
            let decoder = JSONDecoder()
            if let savedFavoriteCharacters = try? decoder.decode(Set<FavoriteCharacter>.self, from: data) {
                characters = savedFavoriteCharacters
            }
        }
        
        logger.info("Favorite Characters were fetched from UserDefaults")
    }
    
    /// Persists user's `FavoriteCharacter`s at UserDefaults
    func persistData() {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(characters) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
        
        logger.info("Favorite Characters were saved into UserDefaults")
    }
    
    /// Adds a new `FavoriteCharacter` into the set of `FavoriteCharacter`s. Triggers fetch and persist operations.
    func addCharacter(favChar: FavoriteCharacter) {
        fetchData()
        characters.insert(favChar)
        persistData()
        
        logger.info("\(favChar.name) added as favorite")
        logger.debug("Current favorites: \(self.characters)")
    }
    
    /// Removes the specified `FavoriteCharacter` from the set of `FavoriteCharacter`s. Triggers fetch and persist operations.
    func removeCharacter(favChar: FavoriteCharacter) {
        fetchData()
        characters.remove(favChar)
        persistData()
        
        logger.info("\(favChar.name) removed from favorites")
        logger.debug("Current favorites: \(self.characters)")
    }
    
    /// Checks whether the given `FavoriteCharacter` is in the set of user's `FavoriteCharacter`s. Triggers a fetch operation.
    func isFavorite(favChar: FavoriteCharacter) -> Bool {
        fetchData()
        return characters.contains { existingFavChar in
            existingFavChar.id == favChar.id
        }
    }
    
    /// An instance of `FavoriteCharacterListViewModel` filled with predefined mock data for testing and debugging purposes
    static var mock: FavoriteCharacterListViewModel {
        let mockModel = FavoriteCharacterListViewModel()
        
        mockModel.characters = [
            FavoriteCharacter(character: Character(charId: 1,
                                                   name: "Walter White",
                                                   nickname: "Heisenberg",
                                                   birthday: "09-07-1958",
                                                   occupation: ["High School Chemistry Teacher", "Meth King Pin"],
                                                   img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                                                   portrayedBy: "Bryan Cranston")),
            FavoriteCharacter(character: Character(charId: 2,
                                                   name: "Jesse Pinkman",
                                                   nickname: "Cap n' Cook",
                                                   birthday: "09-24-1984",
                                                   occupation: ["Meth Dealer"],
                                                   img: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441",
                                                   portrayedBy: "Aaron Paul"))
        ]
        
        return mockModel
    }
}
