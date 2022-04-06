//
//  CharacterCell.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI

struct CharacterCell: View {
    @Binding var character: Character
    
    var body: some View {
        HStack(spacing: 13) {
            AsyncImage(url: URL(string: character.img)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(Font.custom("Quicksand", size: 18).weight(.bold))
                Text("\"\(character.nickname)\"")
                    .font(Font.custom("Quicksand", size: 14))
                    .foregroundColor(Color.secondary)
            }
            Spacer()
        }
        .padding(EdgeInsets.init(top: 6, leading: 0, bottom: 6, trailing: 0))
    }
}

struct CharacterCell_Previews: PreviewProvider {
    @State static var mockChar = Character(char_id: 1,
                  name: "Walter White",
                  nickname: "Heisenberg",
                  birthday: "09-07-1958",
                  occupation: ["High School Chemistry Teacher", "Meth King Pin"],
                  img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                  portrayed: "Bryan Cranston")
    
    static var previews: some View {
        List {
            CharacterCell(character: $mockChar)
        }
    }
}
