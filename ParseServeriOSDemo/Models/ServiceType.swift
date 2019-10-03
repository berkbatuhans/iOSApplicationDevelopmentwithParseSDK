//
//  City.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 22.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import Parse

final class ServiceType: PFObject {
    @NSManaged var name : String?
    @NSManaged var image: PFFileObject?
    
    init(name: String,image:PFFileObject) {
        super.init()
        self.name = name
        self.image = image
    }
    override init() {
        super.init()
    }
    
    override class func query() -> PFQuery<PFObject>? {
        let query = PFQuery(className: ServiceType.parseClassName())
        query.order(byDescending: "createdAt")
//        query.cachePolicy = .networkOnly
        query.cachePolicy = .networkElseCache
        return query
    }
}

extension ServiceType : PFSubclassing {
    static func parseClassName() -> String {
        return "\(self)"
    }
}
