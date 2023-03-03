//
//  ViewModal.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 24/02/23.
//

import Foundation
import GoogleMobileAds

extension MyTabView {
    
    func fetchInterstitial() {
        
        let request = GADRequest()
        
        GADInterstitialAd.load(withAdUnitID: Constants.interstitialAdID, request: request) { ad, error in
            
            guard let ad = ad else {
                print(error?.localizedDescription)
                return
            }
            
            interstitial = ad
            
            DispatchQueue.main.async {
                interstitial?.present(fromRootViewController: UIApplication.shared.topVC ?? UIViewController())
            }
        }
    }
    
}
