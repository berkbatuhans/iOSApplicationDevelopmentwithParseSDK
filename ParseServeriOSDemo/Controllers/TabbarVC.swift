//
//  TabbarVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 255/255, green: 106/255, blue: 6/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor.gray
        removeTabbarItemsText()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
