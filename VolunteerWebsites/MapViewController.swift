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

var geocoder = CLGeocoder()
var addresses: [String] = [String]()

class MapViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager: CLLocationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    @IBOutlet weak var mapView: MKMapView!
    var count = 0
    
    func geocodeAddress(address:String, service: Service){
        //var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if ((error) != nil) {
                print("Error", error)
            }
            if let placemark = placemarks?.first{
                print("inside placemark block")
                print(placemark.location!.coordinate)
                let coordinates = placemark.location!.coordinate
                print(coordinates)
                let artwork = Artwork(title: service.name, locationName: "", discipline: "Volunteering", coordinate: coordinates)
                //print(geocodeAddress(service.address))
                self.mapView.addAnnotation(artwork)
                print("Here")
            }
            
        }
        geocoder = CLGeocoder()
        print("Here")
        
        
       
    }
    
    
    let initialLocation = CLLocation(latitude: 47.5707, longitude: -122.2422)
    
    let regionRadius: CLLocationDistance = 12000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var locationTuples: [(textField: UITextField!, mapItem: MKMapItem?)]!
    
    override func viewDidLoad() {
        centerMapOnLocation(initialLocation)
        
       // locationTuples = [(sourceField, nil), (desinationField1, nil), (destinat)]
        locationManager.delegate = self
        if(authorizationStatus == .Denied) {
            print("DENIED")
            locationManager.requestWhenInUseAuthorization()
        }
        
        for service:Service in homelessServices {
            geocodeAddress(service.address, service: service)
            print("anotha one")
            addresses.append(service.address)
            //let artwork = Artwork(title: service.name, locationName: "Subscript", discipline: "Volunteering", coordinate: geocodeAddress(service.address))
            //print(geocodeAddress(service.address))
            //mapView.addAnnotation(artwork)
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        mapView.showsUserLocation = (status == .AuthorizedAlways)
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //let locValue:CLLocationCoordinate2D = locations.last!
       // print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
}
