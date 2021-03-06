//
//  Character.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import Foundation

// MARK: - Character
/// Represents a Breaking Bad character.
struct Character: Codable {
    /// The stable identity of the entity associated with self
    let charId: Int
    
    /// The name of the character
    let name: String
    
    /// The nickname used for referring to the character
    let nickname: String
    
    /// The character's date of birth
    let birthday: String
    
    /// A list of character's occupations
    let occupation: [String]
    
    /// URL leading to an image of the character
    let img: String
    
    /// Name of the actor portraying this character
    let portrayedBy: String
    
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name
        case nickname
        case birthday
        case occupation
        case img
        case portrayedBy = "portrayed"
    }
}
