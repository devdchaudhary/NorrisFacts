//
//  TabView.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 24/02/23.
//

import SwiftUI
import GoogleMobileAds

struct MyTabView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedTab = 0
    @State var interstitial: GADInterstitialAd?
    @State private var timer: Timer?

    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {

                MyView()
                    .tag(0)
                
                SavedView()
                    .tag(1)
            }
            .padding(.bottom, 20)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .onAppear {
                setupTabBar()
            }
            
            HStack {
                
                Button(action: {
                    withAnimation {
                        selectedTab = 0
                    }
                }) {
                    VStack(spacing: 10) {
                        Text("Jokes")
                            .font(.system(size: 15).bold())
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Rectangle().frame(height: 2)
                            .foregroundColor(selectedTab == 0 ? Color(uiColor: .systemOrange) : .clear)
                    }
                    .padding()
                }
                
                Button(action: {
                    withAnimation {
                        selectedTab = 1
                    }
                }) {
                    VStack(spacing: 10) {
                        Text("Saved")
                            .font(.system(size: 15).bold())
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Rectangle().frame(height: 2)
                            .foregroundColor(selectedTab == 1 ? Color(uiColor: .systemOrange) : .clear)
                    }
                    .padding()
                }
            }
            .background(Color.white)
        }
        .onAppear {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { timer in
                if interstitial != nil {
                    DispatchQueue.main.async {
                        UIApplication.shared.topVC?.dismiss(animated: true)
                    }
                }
                fetchInterstitial()
            }
        }
    }
    
    private func setupTabBar() {
        UITabBar.appearance().clipsToBounds = true
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
       MyTabView()
    }
}
