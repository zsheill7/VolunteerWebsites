//
//  Artwork.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/8/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import MapKit

class Artwork: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let discipline: String
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
