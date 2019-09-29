//
//  Destination.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 22.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//
import UIKit
struct Destination {
    static func go(destination destinationName: String,from controller: UIViewController? = nil,presentationStyle: UIModalPresentationStyle? = .fullScreen,_ isRoot: Bool = false,_ window: UIWindow? = nil){
//        let storyboard: UIStoryboard = AppStoryboard.Main.instance
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: destinationName)
        if !isRoot {
            vc.modalPresentationStyle = presentationStyle!
            controller?.present(vc,animated: true,completion: nil)
        } else {
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }
        // ios 13 ise tam ekranda açmaya zorla.
        
    }
}
