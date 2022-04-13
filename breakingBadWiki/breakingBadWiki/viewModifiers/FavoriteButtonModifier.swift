//
//  FavoriteButtonModifier.swift
//  BreakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 12.04.22.
//

import SwiftUI

// MARK: - FavoriteButtonModifier
/// A `ViewModifier` to style a `Button` as an add/remove `FavoriteCharacter` button
private struct FavoriteButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(FontNames.DefaultBold.rawValue, size: 16))
            .padding(EdgeInsets(top: 5, leading: 25, bottom: 5, trailing: 25))
            .foregroundColor(.white.opacity(0.7))
            .background(.gray.opacity(0.3))
            .cornerRadius(.infinity)
    }
}


// MARK: - Button + FavoriteButtonModifier
extension Button {
    /// - Returns: A button styled for adding or removing a `FavoriteCharacter`
    func favoriteButtonModifier() -> some View {
        ModifiedContent(content: self, modifier: FavoriteButtonModifier())
    }
}
