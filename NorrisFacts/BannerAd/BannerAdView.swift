//
//  BannerAdView.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 21/02/23.
//

import SwiftUI
import GoogleMobileAds

struct BannerView: UIViewControllerRepresentable {
    
    @State private var viewWidth: CGFloat = UIScreen.main.bounds.width
    private let bannerView = GADBannerView()
    private let adUnitID = "ca-app-pub-3940256099942544/2934735716"
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let bannerViewController = BannerViewController()
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = bannerViewController
        bannerViewController.view.addSubview(bannerView)
        
        return bannerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        // Request a banner ad with the updated viewWidth.
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerView.load(GADRequest())
        
    }
}
