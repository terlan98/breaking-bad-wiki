//
//  CharacterDetailSection.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 07.04.22.
//

import SwiftUI
import FancyScrollView

// MARK: - CharacterDetailSection
/// A `View` intended for showing a single property of a `Character`
struct CharacterDetailSection<Content: View>: View {
    
    /// The title (property name) of this section
    var sectionTitle: String
    /// The name of an SF Symbol to be shown before the title
    var sectionSFIconName: String?
    /// The content to be shown under the title
    var content: Content
    
    /// Initializes a new instance of `CharacterDetailSection` with the given title and content. Can optionally accept an SF Symbol name.
    init(sectionTitle: String, sectionSFIconName: String? = nil, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.sectionTitle = sectionTitle
        self.sectionSFIconName = sectionSFIconName
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack (alignment: .center, spacing: 5) {
                if sectionSFIconName != nil {
                    Image(systemName: sectionSFIconName!)
                        .font(Font.system(size: 17, weight: .regular))
                }
                
                Text(sectionTitle.uppercased())
                    .font(Font.custom(FontNames.Default.rawValue, size: 15).weight(.black))
            }
            .foregroundColor(.white.opacity(0.8))
            .padding([.top, .leading], 10)
            
            content
                .font(Font.custom(FontNames.Default.rawValue, size: 21).weight(.medium))
                .foregroundColor(.white)
                .padding(EdgeInsets.init(top: 7, leading: 25, bottom: 0, trailing: 0))
        }
    }
}

// MARK: - CharacterDetailSection Previews
struct CharacterDetailSection_Previews: PreviewProvider {
    static var previews: some View {
        VStack (alignment: .leading) {
            CharacterDetailSection(sectionTitle: "Nickname") {
                Text("Walter White")
            }
            CharacterDetailSection(sectionTitle: "Date of Birth", sectionSFIconName: "calendar") {
                Text("28/12/1998")
            }
        }.frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(Color.green)
    }
}
