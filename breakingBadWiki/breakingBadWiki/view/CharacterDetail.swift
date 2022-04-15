//
//  CharacterDetail.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import SwiftUI
import FancyScrollView

// MARK: - CharacterDetail
/// Detail `View` for a single `Character`
struct CharacterDetail: View {
    /// The model to read from
    @Binding var character: Character
    
    /// The model used for handling user's favorite characters
    @StateObject private var favCharacterListVM = FavoriteCharacterListViewModel()
    
    /// The name of the icon used for the button that adds/removes favorites
    @State var favButtonIconName = FavoriteButtonState.notFavorite.rawValue
    
    var body: some View {
        let color = Color("OpaqueGreenBackgroundColor")
        
        ZStack { // color + FancyScrollView
            color.ignoresSafeArea() // background color

            FancyScrollView(title: "\(character.name)", titleColor: color, headerHeight: 300, scrollUpHeaderBehavior: .parallax, scrollDownHeaderBehavior: .offset) {
                AsyncImage(url: URL(string: character.img)) { image in
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
            } content: {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        CharacterDetailSection(sectionTitle: "Nickname", sectionSFIconName: "person.text.rectangle.fill") {
                            Text("\(character.nickname)")
                        }
                        
                        Spacer()
                        
                        Button {
                            if favButtonIconName == FavoriteButtonState.notFavorite.rawValue {
                                favCharacterListVM.addCharacter(favChar: FavoriteCharacter(character: character))
                            }
                            else {
                                favCharacterListVM.removeCharacter(favChar: FavoriteCharacter(character: character))
                            }
                            updateFavoriteButtonIcon()
                        } label: {
                            Image(systemName: favButtonIconName)
                        }
                        .favoriteButtonModifier()
                        .padding([.top, .trailing], 8)
                    }
                    CharacterDetailSection(sectionTitle: "Birthday", sectionSFIconName: "calendar") {
                        Text("\(character.birthday)")
                    }
                    CharacterDetailSection(sectionTitle: "Occupations", sectionSFIconName: "briefcase.fill") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (spacing: 5) {
                                ForEach(character.occupation, id: \.self) { occupation in
                                    RoundedTextView(text: occupation, backgroundColor: ColorGenerator.generate(for: occupation), textColor: Color("TextColor"))
                                }
                            }
                        }
                    }
                    CharacterDetailSection(sectionTitle: "Portrayed by", sectionSFIconName: "theatermasks.fill") {
                        Text("\(character.portrayedBy)")
                    }
                    Spacer()
                }.frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .background(color)
            }
        }
        .onAppear {
            updateFavoriteButtonIcon()
        }
    }
    
    /// Updates the icon of the favorite add/remove button based on a `FavoriteCharacterListViewModel`
    func updateFavoriteButtonIcon() {
        favButtonIconName = favCharacterListVM.isFavorite(favChar: FavoriteCharacter(character: character)) ? FavoriteButtonState.Favorite.rawValue : FavoriteButtonState.notFavorite.rawValue
    }
}

/// Indicates the current state of the favorite add/remove button
enum FavoriteButtonState: String {
    case notFavorite = "star"
    case Favorite = "star.fill"
}


// MARK: - CharacterDetail Previews
struct CharacterDetail_Previews: PreviewProvider {
    @State static var mockChar = Character(charId: 1,
                  name: "Walter White",
                  nickname: "Heisenberg",
                  birthday: "09-07-1958",
                  occupation: ["Chemistry Teacher", "Meth King Pin", "Doctor", "Another Occupation"],
                  img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                  portrayedBy: "Bryan Cranston")
    
    static var previews: some View {
        CharacterDetail(character: $mockChar)
    }
}
