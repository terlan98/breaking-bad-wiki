//
//  RoundedTextView.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 08.04.22.
//

import SwiftUI

// MARK: - RoundedTextView
/// A view that shows text with a rounded background
struct RoundedTextView: View {
    
    /// The text to be shown
    var text: String
    /// The background color of the text
    var backgroundColor: Color
    /// The color of the text
    var textColor: Color
    
    var body: some View {
        HStack {
            Text(text)
                .font(Font.custom(FontNames.Default.rawValue, size: 15).weight(.semibold))
                .foregroundColor(textColor)
                .multilineTextAlignment(.center)
        }
        .padding(EdgeInsets(top: 9, leading: 13, bottom: 9, trailing: 13))
        .background(backgroundColor.opacity(0.8))
        .cornerRadius(.greatestFiniteMagnitude)
    }
}

// MARK: - RoundedTextView Previews
struct RoundedTextView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedTextView(text: "Chemistry Teacher", backgroundColor: Color.mint, textColor: Color("TextColor"))
    }
}
