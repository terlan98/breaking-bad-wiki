//
//  RoundedTextView.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 08.04.22.
//

import SwiftUI

struct RoundedTextView: View {
    
    var text: String
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            Text(text)
                .font(Font.custom(FontNames.Default.rawValue, size: 15).weight(.semibold))
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
        }
        .padding(EdgeInsets(top: 9, leading: 13, bottom: 9, trailing: 13))
        .background(backgroundColor.opacity(0.8))
        .cornerRadius(.greatestFiniteMagnitude)
    }
}

struct RoundedTextView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedTextView(text: "Chemistry Teacher", backgroundColor: Color.mint)
    }
}
