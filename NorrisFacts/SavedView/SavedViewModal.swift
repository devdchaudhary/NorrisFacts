//
//  ViewModal.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 24/02/23.
//

import SwiftUI

extension SavedView {
    
    func shareJoke(_ joke: String) {
        let url = URL(string: "https://appstore.com/norrisfacts")
        if let url {
            let finalString = """
            \(joke)
            Checkout this joke and more at
            \(url)
            """
            let activityVC = UIActivityViewController(activityItems: [finalString], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
}
