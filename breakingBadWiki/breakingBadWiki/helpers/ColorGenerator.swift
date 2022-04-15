//
//  RandomColorGenerator.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 08.04.22.
//

import SwiftUI

// MARK: - ColorGenerator
/// Generates `Color`s
struct ColorGenerator {
    private static let colors = [
        Color.orange,
        Color.teal,
        Color.pink,
        Color.indigo,
        Color.gray,
        Color.purple,
    ]
    
    /// Generates a color based on the hash of the given string
    static func generate(for string: String) -> Color {
        return colors[abs(string.hashValue) % colors.count]
    }
}
