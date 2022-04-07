//
//  CharacterListViewModel.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import Foundation
import OSLog


@MainActor
class CharacterListViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    
    let logger = Logger()
    
    func fetchData() async {
        let urlString = "https://www.breakingbadapi.com/api/characters"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            self.characters = try JSONDecoder().decode([Character].self, from: data)
            
            logger.info("Fetched \(self.characters.count) characters")
        }
        catch {
            logger.notice("Failed to fetch data: \(error.localizedDescription)")
        }
    }
    
    static var mock: CharacterListViewModel {
        let mockModel = CharacterListViewModel()
        
        mockModel.characters = [
            Character(char_id: 1,
                      name: "Walter White",
                      nickname: "Heisenberg",
                      birthday: "09-07-1958",
                      occupation: ["High School Chemistry Teacher", "Meth King Pin"],
                      img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                      portrayed: "Bryan Cranston"),
            Character(char_id: 2,
                      name: "Jesse Pinkman",
                      nickname: "Cap n' Cook",
                      birthday: "09-24-1984",
                      occupation: ["Meth Dealer"],
                      img: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441",
                      portrayed: "Aaron Paul")
        ]
        
        return mockModel
    }
}
