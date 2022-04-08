//
//  RandomColorGenerator.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 08.04.22.
//

import SwiftUI

struct RandomColorGenerator {
    private static let colors = [
        Color.orange,
        Color.teal,
        Color.pink,
        Color.indigo,
        Color.gray,
        Color.purple,
    ]
    
    static func generate() -> Color {
        return colors.randomElement()!
    }
}
