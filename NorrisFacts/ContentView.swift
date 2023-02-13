//
//  ContentView.swift
//  APIPractice
//
//  Created by Devanshu Dev Chaudhary on 12/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var jokeList: [JokeModel] = []
    var norrisImages = ["norris", "norris2", "norris3", "norris4"]
    
    init() {
        UIRefreshControl.appearance().tintColor = .orange
    }
    
    var body: some View {
        
        List(jokeList.reversed(), id: \.uid) { joke in
            
            VStack {
                
                HStack {
                    
                    if let url = joke.iconUrl {
                        
                        if let imageString = norrisImages.randomElement() {
                            
                            WebImage(url: url)
                                .resizable()
                                .placeholder(Image(imageString))
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(48)
                                .clipped()
                        }
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
