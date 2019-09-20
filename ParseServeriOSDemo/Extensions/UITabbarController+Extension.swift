//
//  UITabbarItem+Extension.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    func removeTabbarItemsText() {
        tabBar.items?.forEach {
            $0.title = ""
            $0.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear], for: .selected)
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear], for: .normal)
        }
        
    }
    
}
