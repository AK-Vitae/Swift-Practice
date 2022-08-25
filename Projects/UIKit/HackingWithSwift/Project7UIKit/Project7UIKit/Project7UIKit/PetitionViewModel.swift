//
//  PetitionViewModel.swift
//  Project7UIKit
//
//  Created by Ramadugu, Akshith on 8/21/22.
//

import UIKit
import Combine

class PetitionViewModel {
    @Published var allPetitions: [Petition] = []

    var petitionSubscription: AnyCancellable?
    
    init() {
        //getPetitions()
    }
    
    func getPetitions(navigationControllerTag: Int?) {
        guard let url = getURL(navigationControllerTag: navigationControllerTag) else { return }
        
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
    
    func getURL(navigationControllerTag: Int?) -> URL? {
        var url: URL?
        
        if navigationControllerTag == 0 {
            url = URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json")
        } else {
            url = URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json")
        }
        
        return url
    }
}
