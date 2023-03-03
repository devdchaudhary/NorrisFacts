//
//  Model.swift
//  APIPractice
//
//  Created by devdchaudhary on 12/02/23.
//

import Foundation

struct JokeModel: Codable {
    
    var uid = UUID()
    var id: String
    var image: String
    var jokeValue: String
    
    init(_ data: [String : Any]) {
        
        id = data["id"] as? String ?? ""
        jokeValue = data["value"] as? String ?? ""
        
        image = Constants.norrisImages.randomElement() ?? ""
    }
}
