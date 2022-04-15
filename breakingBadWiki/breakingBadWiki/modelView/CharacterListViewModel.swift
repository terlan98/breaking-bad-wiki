//
//  CharacterListViewModel.swift
//  breakingBadWiki
//
//  Created by Tarlan Ismayilsoy on 06.04.22.
//

import Foundation
import OSLog

// MARK: - CharacterListViewModel
@MainActor
class CharacterListViewModel: ObservableObject {
    
    /// The `Character`s of Breaking Bad
    @Published var characters: [Character] = []
    
    /// Logs information about the contents of the view model
    let logger = Logger()
    
    /// Fetches the list of `Character`s from the Breaking Bad API
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
    
    /// An instance of `CharacterListViewModel` filled with predefined mock data for testing and debugging purposes
    static var mock: CharacterListViewModel {
        let mockModel = CharacterListViewModel()
        
        mockModel.characters = [
            Character(charId: 1,
                      name: "Walter White",
                      nickname: "Heisenberg",
                      birthday: "09-07-1958",
                      occupation: ["High School Chemistry Teacher", "Meth King Pin"],
                      img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
                      portrayedBy: "Bryan Cranston"),
            Character(charId: 2,
                      name: "Jesse Pinkman",
                      nickname: "Cap n' Cook",
                      birthday: "09-24-1984",
                      occupation: ["Meth Dealer"],
                      img: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441",
                      portrayedBy: "Aaron Paul")
        ]
        
        return mockModel
    }
}
