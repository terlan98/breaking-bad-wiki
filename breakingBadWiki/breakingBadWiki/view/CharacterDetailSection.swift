//
//  CharacterDetailSection.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 07.04.22.
//

import SwiftUI
import FancyScrollView

struct CharacterDetailSection<Content: View>: View {
    
    var sectionTitle: String
    var sectionSFIconName: String?
    var content: Content
    
    /// Initializes a new instance of `CharacterDetailSection` with the given title and content
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
