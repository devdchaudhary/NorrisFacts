//
//  APIManager.swift
//  APIPractice
//
//  Created by devdchaudhary on 12/02/23.
//

import Foundation

struct APIManager {
    
    static let shared = APIManager()
    
    func fetchJokeData(url: URL, completionHandler: @escaping (Result<[JokeModel], Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            do {
                if let data {
                    let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
                    if let json = json {
                        completionHandler(.success([JokeModel(json)]))
                    }
                }
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}
