//
//  DetailVC.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 19.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

class DetailVC: UIViewController {
    
    var currentObject : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let object = currentObject {
            navigationItem.title = object.name
        }
        
    }

}
