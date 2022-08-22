//
//  PetitionViewModel.swift
//  Project7UIKit
//
//  Created by Ramadugu, Akshith on 8/21/22.
//

import Foundation
import Combine

class PetitionViewModel {
    @Published var allPetitions: [Petition] = []

    var petitionSubscription: AnyCancellable?
    
    init() {
        getPetitions()
    }
    
    func getPetitions() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json") else { return }
        
        petitionSubscription = NetworkManager.download(url: url)
            .decode(type: Petitions.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(String(describing: error))
                }
            }, receiveValue: { [weak self] returnedPetitions in
                self?.allPetitions = returnedPetitions.results
                self?.petitionSubscription?.cancel()
            })
    }
}
