//
//  Character.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import Foundation

struct Character: Codable {    
    let char_id: Int
    let name: String
    let nickname: String
    let birthday: String
    let occupation: [String]
    let img: String
    let portrayed: String
}
