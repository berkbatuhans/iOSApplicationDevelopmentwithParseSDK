//
//  Service+Crud.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 24.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Parse
import NotificationCenter

extension Service {
    func create<T: PFObject>(_ object: T) {
        let object = object
        object.saveInBackground { (success, error) in
            if success {
                print("Nesne Kaydedildi")
            } else {
                print("HATA")
            }
        }
    }
    
    func read<T: PFQuery<PFObject>>(_ object: T,withId: String) {
        let object = object
        object.getObjectInBackground(withId: withId) { (obje, error) in
            if error == nil {
                print(obje!)
            } else {
                
            }
        }
    }
}
