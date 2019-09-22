//
//  Destination.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 22.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//
import UIKit
struct Destination {
    static func go(from destinationName: String, from controller: UIViewController){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: destinationName)
        // ios 13 ise tam ekranda açmaya zorla.
        vc.modalPresentationStyle = .fullScreen
        controller.present(vc,animated: true,completion: nil)
    }
}
