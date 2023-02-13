//
//  ContentView.swift
//  APIPractice
//
//  Created by Devanshu Dev Chaudhary on 12/02/23.
//

import SwiftUI

struct MyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var jokeList: [JokeModel] = []
    
    init() {
        UIRefreshControl.appearance().tintColor = .orange
    }
    
    var body: some View {
        
        List(jokeList.reversed(), id: \.uid) { joke in
            
            VStack {
                
                HStack {
                    
                    if let url = joke.iconUrl {
                        
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Image("norris")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .cornerRadius(48)
                    }
                    
                    Button(action: {
                        shareButtonClicked(joke.jokeValue)
                    }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .frame(width: 20, height: 20)
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
            fetchJokes()
        }
        .refreshable {
            fetchJokes()
        }
    }
    
    private func shareButtonClicked(_ joke: String) {
        shareJoke(joke)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
