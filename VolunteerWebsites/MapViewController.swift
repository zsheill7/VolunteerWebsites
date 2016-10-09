//
//  MapViewController.swift
//  VolunteerWebsites
//
//  Created by Zoe on 10/8/16.
//  Copyright © 2016 Zoe. All rights reserved.
//

import CoreLocation
import UIKit
import MapKit

let geocoder = CLGeocoder()

func geocodeAddress(address:String) -> CLLocationCoordinate2D{
    geocoder.geocodeAddressString(address) { (placemarks, error) in
        if ((error) != nil) {
            print("Error", error)
        }
        if let placemark = placemarks?.first {
            let coordinates: CLLocationCoordinate2D = placemark.location!.coordinate
            return coordinates
        }
    }
}

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 47.5707, longitude: -122.2422)
    
    let regionRadius: CLLocationDistance = 12000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    override func viewDidLoad() {
        
        for service in homelessServices {
            let artwork = Artwork(title: service["title"], locationName: "", coordinate: )
        }
        centerMapOnLocation(initialLocation)
    }
    
    
}
