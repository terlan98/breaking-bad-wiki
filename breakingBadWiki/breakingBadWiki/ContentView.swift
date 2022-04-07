//
//  ContentView.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharacterList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            ContentView().colorScheme(colorScheme)
        }
    }
}
