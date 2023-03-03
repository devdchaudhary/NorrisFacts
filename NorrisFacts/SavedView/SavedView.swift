//
//  SavedView.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 24/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SavedView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var myJokes: [JokeModel] = []
    
    var body: some View {
        
        List(myJokes.reversed(), id: \.id) { joke in
            
            VStack {
                
                HStack {
                    
                    Image(joke.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(48)
                        .clipped()
                    
                    Button(action: {
                        shareButtonClicked(joke.jokeValue)
                    }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .frame(width: 30, height: 30)
                            .aspectRatio(contentMode: .fit)
                    }
                    .buttonStyle(.plain)
                    
                }
                
                Text(joke.jokeValue)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
            }
        }
        .listStyle(.inset)
        .listRowSeparator(.hidden)
        .onAppear {
            let jokes: [JokeModel]? = PersistanceManager.shared.codableRetrieveValue(.joke)
            myJokes = jokes ?? []
        }
        
    }
    
    private func shareButtonClicked(_ joke: String) {
        shareJoke(joke)
    }
    
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
