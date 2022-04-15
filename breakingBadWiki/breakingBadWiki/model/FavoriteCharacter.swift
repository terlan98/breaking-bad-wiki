//
//  FavoriteCharacter.swift
//  BreakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 11.04.22.
//

import Foundation

// MARK: - FavoriteCharacter
/// Represents a favorite Breaking Bad character of the user.
struct FavoriteCharacter {
    /// The stable identity of the entity associated with self
    let id: Int
    
    /// The name of the character
    let name: String
    
    /// The nickname used for referring to the character
    let nickname: String
    
    /// The character's date of birth
    let birthday: String
    
    /// A list of character's occupations
    let occupation: [String]
    
    /// URL leading to an image of the character
    let imgURL: String
    
    /// Name of the actor portraying this character
    let portrayedBy: String
    
    /// Creates an instace of `FavoriteCharacter` based on a `Character` instance
    init(character: Character) {
        self.id = character.charId
        self.name = character.name
        self.nickname = character.nickname
        self.birthday = character.birthday
        self.occupation = character.occupation
        self.imgURL = character.img
        self.portrayedBy = character.portrayedBy
    }
    
    /// Converts this instance of `FavoriteCharacter` into a `Character`
    func asCharacter() -> Character {
        return Character(charId: self.id,
                         name: self.name,
                         nickname: self.nickname,
                         birthday: self.birthday,
                         occupation: self.occupation,
                         img: self.imgURL,
                         portrayedBy: self.portrayedBy)
    }
}

// MARK: - FavoriteCharacter + Codable
extension FavoriteCharacter: Codable { }

// MARK: - FavoriteCharacter + Hashable
extension FavoriteCharacter: Hashable { }
