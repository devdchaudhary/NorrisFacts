//
//  Model.swift
//  APIPractice
//
//  Created by Devanshu Dev Chaudhary on 12/02/23.
//

import Foundation

struct JokeModel: Decodable {
    
    var uid: UUID
    var id: String
    var iconUrl: URL?
    var jokeValue: String
    
    init(_ data: [String : Any]) {
        uid = UUID()
        id = data["id"] as? String ?? ""
        jokeValue = data["value"] as? String ?? ""
    
        let url = data["icon_url"] as? String ?? ""
        iconUrl = URL(string: url)
    }
}
