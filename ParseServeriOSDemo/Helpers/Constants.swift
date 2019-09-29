//
//  Constants.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import UIKit

///Segues
struct Segues {
    
}

/// App identifiers
struct Identifiers {
    static let mainVC = "MainVC"
    static let cities     = "CitiesVC"
    static let loggedIn  = LoginVC.self
    static let signIn      = "RegisterVC"
    static let auth = "AuthVC"
    static let serviceType = "ServiceTypeVC"
    static let serviceProvider = "ServiceProviderVC"
}

enum AppStoryboard: String {
    case Main = "Main"
    case Login = "Login"
    case Venue = "Venue"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

