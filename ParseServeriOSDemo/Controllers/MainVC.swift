//
//  ViewController.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 18.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import UIKit
import Parse

class MainVC: UIViewController,UITextFieldDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current() != nil {
            Service.shared.goToDestination(destinationName: Identifiers.cities,viewController: self)
        } else {
            //Service.shared.goToDestination(destinationName: Identifiers.mainVC,viewController: self)
        }
    }
    
    func saveObject() {
        let cities = PFObject(className: "Cities")
        cities["name"] = "İstanbul"
        cities["code"] = 34
        cities.saveInBackground()
    }
    
    func list() {
        let query = PFQuery(className: "Cities")
        query.getObjectInBackground(withId: "HVmuJLO3bH") { (cities, error) in
            if error == nil {
                print(cities?.object(forKey: "name")!)
            } else {
                
            }
            
        }
        
    }
    
    
    
    
}

