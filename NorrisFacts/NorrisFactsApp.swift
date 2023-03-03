//
//  NorrisFactsMain.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 13/02/23.
//

import SwiftUI
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        GADMobileAds.sharedInstance().start()
        
        return true
    }
    
}

@main
struct NorrisFactsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MyTabView()
        }
    }
}

