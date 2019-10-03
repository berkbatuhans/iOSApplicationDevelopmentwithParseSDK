//
//  City.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 22.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse

final class City: PFObject {
    @NSManaged var name : String?
    @NSManaged var stateCode: NSNumber?
    @NSManaged var location: PFGeoPoint?
    @NSManaged var rating: NSNumber?
    @NSManaged var image: PFFileObject?
    
    init(name: String, stateCode: NSNumber,location: PFGeoPoint, rating: NSNumber,image:PFFileObject) {
        super.init()
        self.name = name
        self.stateCode = stateCode
        self.location = location
        self.rating = rating
        self.image = image
    }
    override init() {
        super.init()
    }
    
    override class func query() -> PFQuery<PFObject>? {
        let query = PFQuery(className: City.parseClassName())
        query.order(byDescending: "createdAt")
//        query.cachePolicy = .networkOnly
        query.cachePolicy = .networkElseCache
        return query
    }
}

extension City : PFSubclassing {
    static func parseClassName() -> String {
        return "City"
    }
}
