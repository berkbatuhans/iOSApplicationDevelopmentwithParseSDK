//
//  ServiceProviderVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 29.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit

class ServiceProviderVC: UIViewController {
    
    var currentObject : ServiceType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let object = currentObject {
            navigationItem.title = object.name
        }
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
