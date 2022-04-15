//
//  FavoriteCharacterCarouselItem.swift
//  BreakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 12.04.22.
//

import SwiftUI
import ACarousel

// MARK: - FavoriteCharacterCarouselItem
/// An ACarousel item representing a single `FavoriteCharacter`
struct FavoriteCharacterCarouselItem: View {
    /// The model to read the data from
    @Binding var favCharacter: FavoriteCharacter
    
    var body: some View {
        Group {
            VStack (alignment: .leading) {
                
                AsyncImage(url: URL(string: favCharacter.imgURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxHeight: 260)
                        .cornerRadius(5)
                } placeholder: {
                    ProgressView()
                }
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(favCharacter.name.uppercased())
                            .font(Font.custom(FontNames.DefaultBold.rawValue, size: 17))
                            .padding(.top, 10)
                        Text(favCharacter.nickname.uppercased())
                            .font(Font.custom(FontNames.Default.rawValue, size: 16))
                    }
                    .lineLimit(1)
                    
                    Spacer()
                    NavigationLink(destination: CharacterDetail(character: Binding.constant(favCharacter.asCharacter()))) {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(Font.system(size: 25))
                    }
                }
                .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color("GreenBackgroundColor"))
        .cornerRadius(10)
        .frame(maxWidth: 320)
    }
}

// MARK: - FavoriteCharacterCarouselItem Previews
struct FavoriteCharacterCarouselItem_Previews: PreviewProvider {
    static var mockChar = Character(charId: 1,
                  name: "Walter White",
                  nickname: "Heisenberg",
                  birthday: "09-07-1958",
                  occupation: ["High School Chemistry Teacher", "Meth King Pin"],
                  img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                  portrayedBy: "Bryan Cranston")
    
    @State static var mockFavChar = FavoriteCharacter(character: mockChar)
    
    static var previews: some View {
        ACarousel([mockFavChar, mockFavChar], id: \.id, spacing: 20, headspace: 20, sidesScaling: 0.8) { favCharacter in
            FavoriteCharacterCarouselItem(favCharacter: $mockFavChar)
        }
    }
}
