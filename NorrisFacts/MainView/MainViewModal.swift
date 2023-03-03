//
//  ViewModel.swift
//  APIPractice
//
//  Created by devdchaudhary on 12/02/23.
//

import Foundation
import SwiftUI
import GoogleMobileAds

extension MyView {
    
    func shareJoke(_ joke: String) {
        let url = URL(string: "https://appstore.com/norrisfacts")
        if let url {
            let finalString = """
            \(joke)
            Checkout this joke and more at
            \(url)
            """
            let activityVC = UIActivityViewController(activityItems: [finalString], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func fetchJokes() {
        
        let url = URL(string: "https://api.chucknorris.io/jokes/random")
                
        if let url {
            APIManager.shared.fetchJokeData(url: url) { result in
                switch result {
                case .success(let jokes):
                    DispatchQueue.main.async {
                        withAnimation {
                            for joke in jokes {
                                jokeList.append(joke)
                            }
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

