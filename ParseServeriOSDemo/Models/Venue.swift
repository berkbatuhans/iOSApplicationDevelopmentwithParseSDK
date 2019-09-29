//
//  Venue.swift
//  ParseServeriOSDemo
//
//  Created by Berk Batuhan ŞAKAR on 24.09.2019.
//  Copyright © 2019 Berk Batuhan ŞAKAR. All rights reserved.
//

import Foundation
import CoreLocation

enum VenueType: Int {
    case praireWedding
    case hotels
    case historicalVenue
    case socialFacilities
    case restaurants
    case clubsInvitationArea
    case boat
    case nuptialsHalls
    case postWeddingDinner
}

struct Venue {
    let title: String
    let address: String
    let website: String
    let type: VenueType
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}
