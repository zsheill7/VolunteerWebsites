//
//  MapViewController.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/8/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import CoreLocation
import UIKit

class MapViewController: UIViewController {

    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        
    }
    
    func geocodeAddress(address:String) {
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if ((error) != nil) {
                print("Error", error)
            }
            if let placemark = placemarks?.first {
                let coordinates: CLLocationCoordinate2D = placemark.location!.coordinate
            }
        }
    }
}
