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
        ZStack {
            Color.green.ignoresSafeArea() // background color

            FancyScrollView(title: "\(character.name)", titleColor: .green, headerHeight: 300, scrollUpHeaderBehavior: .parallax, scrollDownHeaderBehavior: .offset) {
                AsyncImage(url: URL(string: character.img)) { image in
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
            } content: {
                VStack (alignment: .leading, spacing: 10) {
                    CharacterDetailSection(sectionTitle: "Nickname", sectionSFIconName: "person.text.rectangle.fill") {
                        Text("\(character.nickname)")
                    }
                    CharacterDetailSection(sectionTitle: "Birthday", sectionSFIconName: "calendar") {
                        Text("\(character.birthday)")
                    }
                    CharacterDetailSection(sectionTitle: "Occupations", sectionSFIconName: "briefcase.fill") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 5) {
                                ForEach(character.occupation, id: \.self) { occupation in
                                    RoundedTextView(text: occupation, backgroundColor: RandomColorGenerator.generate())
                                }
                            }
                        }
                    }
                    CharacterDetailSection(sectionTitle: "Portrayed by", sectionSFIconName: "theatermasks.fill") {
                        Text("\(character.portrayed)")
                    }
                    Spacer()
                }.frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .background(Color.green)
        }
        }
    }
}



struct CharacterDetail_Previews: PreviewProvider {
    @State static var mockChar = Character(char_id: 1,
                  name: "Walter White",
                  nickname: "Heisenberg",
                  birthday: "09-07-1958",
                  occupation: ["Chemistry Teacher", "Meth King Pin", "Doctor", "Another Occupation"],
                  img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                  portrayed: "Bryan Cranston")
    
    static var previews: some View {
        CharacterDetail(character: $mockChar)
    }
}
