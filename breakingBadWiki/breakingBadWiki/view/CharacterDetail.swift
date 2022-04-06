//
//  CharacterDetail.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI
import FancyScrollView

struct CharacterDetail: View {
    @Binding var character: Character
    
    var body: some View {
        FancyScrollView(title: "\(character.name)", titleColor: .green, headerHeight: 300, scrollUpHeaderBehavior: .parallax, scrollDownHeaderBehavior: .offset) {
            AsyncImage(url: URL(string: character.img)) { image in
                    image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
        } content: {
            VStack (alignment: .leading) {
                Text("Nickname")
                    .padding()
                Text("\"\(character.nickname)\"")
                    .padding()
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading
              )
            .background(Color.green)
        }
        .backgroundViewModifier()
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    @State static var mockChar = Character(char_id: 1,
                  name: "Walter White",
                  nickname: "Heisenberg",
                  birthday: "09-07-1958",
                  occupation: ["High School Chemistry Teacher", "Meth King Pin"],
                  img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                  portrayed: "Bryan Cranston")
    
    static var previews: some View {
        CharacterDetail(character: $mockChar)
    }
}
