//
//  PersistanceManager.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 24/02/23.
//

import Foundation

class PersistanceManager {
    
    enum UserFile: String {
        case joke
    }
    
    static let shared = PersistanceManager()
    private init(){}
    
    public func codableSaveFile<T: Codable>(_ file: UserFile, value: T) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let data = try? encoder.encode(value) {
            UserDefaults.standard.set(data, forKey: file.rawValue)
        }
    }
    
    public func codableRetrieveValue<T: Codable>(_ file: UserFile) -> T? {
        
        guard let data = UserDefaults.standard.value(forKey: file.rawValue) as? Data else {return nil}
        return try? JSONDecoder().decode(T.self, from: data)
        
    }
    
    public func appendJoke(_ modal: JokeModel) {
        
        let savedJokes: [JokeModel]? = codableRetrieveValue(.joke)
        var jokes = savedJokes ?? []
        jokes.append(modal)
        
        codableSaveFile(.joke, value: jokes)
        
    }
    
}
