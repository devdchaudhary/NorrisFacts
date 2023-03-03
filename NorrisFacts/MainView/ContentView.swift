//
//  ContentView.swift
//  APIPractice
//
//  Created by devdchaudhary on 12/02/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var jokeList: [JokeModel] = []
    @State private var timer: Timer?
    
    var body: some View {
        
        List(jokeList.reversed(), id: \.uid) { joke in
            
            VStack {
                
                if let lastJoke = jokeList.last?.id {
                    if joke.id == lastJoke {
                        
                        Text("Newest!")
                            .foregroundColor(.orange)
                            .font(.system(size: 15).bold())
                        
                    }
                }
                
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
                
                Button(action: {
                    saveButtonClicked(value: joke)
                }) {
                    Image(systemName: "folder.fill")
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                }
                .buttonStyle(.plain)
                
            }
        }
        .listStyle(.inset)
        .listRowSeparator(.hidden)
        .refreshable {
            fetchJokes()
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = .orange
            fetchJokes()
        }
    }
    
    private func saveButtonClicked(value: JokeModel) {
        
        let jokes: [JokeModel]? = PersistanceManager.shared.codableRetrieveValue(.joke)
        
        if let jokes {
            if !jokes.contains(where: { $0.id == value.id}) {
                PersistanceManager.shared.appendJoke(value)
            }
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
