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
//       saveObject()
//        Service.shared.read(City.query()!, withId: "2vltnDVJT4")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func saveObject() {
//        let city = City()
//        city.name = "Küçükçekmece"
//        city.location = PFGeoPoint(latitude: 34.0, longitude: 34.0)
//        city.rating = 5
//        Service.shared.create(city)
        
        let serviceType = ServiceType()
        serviceType.name = "Mekanlar"
        Service.shared.create(serviceType)
    }
    
    func list() {
        let query = PFQuery(className: "Cities")
        query.getObjectInBackground(withId: "HVmuJLO3bH") { (cities, error) in
            if error == nil {
                //print(cities?.object(forKey: "name")!)
            } else {
                
            }
            
        }
    }
    
    
    
    
}

