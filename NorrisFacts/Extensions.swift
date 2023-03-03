//
//  Extensions.swift
//  NorrisFacts
//
//  Created by devdchaudhary on 22/02/23.
//

import UIKit

extension UIApplication {
    
    public var topVC: UIViewController? {
        return topViewController(rootVC)
    }
    
    private var rootVC: UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil }
        return windowScene.windows.first?.rootViewController
    }
    
    private func topViewController(_ base: UIViewController?) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
}
