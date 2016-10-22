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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var customDetailView: UIButton!
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
                let artwork = Artwork(title: service.name, locationName: service.tag, discipline: "Volunteering", coordinate: coordinates)
                //print(geocodeAddress(service.address))
               
                self.mapView.addAnnotation(artwork)
                print("Here")
            }
            
        }
        geocoder = CLGeocoder()

        
        
       
    }
    @IBAction func directionsTapped(sender: AnyObject) {
        
        
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
        mapView.delegate = self
        for service:Service in homelessServices {
            geocodeAddress(service.address, service: service)
            addresses.append(service.address)
        }
        for service:Service in healthServices {
            geocodeAddress(service.address, service: service)
            addresses.append(service.address)
        }
        for service:Service in enviServices {
            geocodeAddress(service.address, service: service)
            addresses.append(service.address)
        }
        for service:Service in animalServices {
            geocodeAddress(service.address, service: service)
            addresses.append(service.address)
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
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        view.detailCalloutAccessoryView = customDetailView
    }
    
    func getDirections(placemark: MKPlacemark, address: String) {
        var mapItem = MKMapItem(placemark: placemark)
        mapItem.name = address
        var launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMapsWithLaunchOptions(launchOptions)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
       
        print("Here1")
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        print(annotation.subtitle)
        print(annotation.title)
        print("here2")
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            //pinView!.pinTintColor = UIColor.purpleColor()
            
            let btn = UIButton(type: .DetailDisclosure)
            pinView?.rightCalloutAccessoryView = btn
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("called")
        if let annotation = view.annotation{
            print("in let annotatin")
            let coordinate = annotation.coordinate/*.stringByTrimmingCharactersInSet(
                NSCharacterSet.whitespaceAndNewlineCharacterSet()
            )*/
            let region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.01, 0.02))
            let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            let options = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
            mapItem.name = annotation.title!
            mapItem.openInMapsWithLaunchOptions(options)
            /*if let url = NSURL(string: "http://maps.apple.com/?ll=\(address.latitude),\(address.longitude)") {
                print("in url")
                print(url)
                UIApplication.sharedApplication().openURL(url)
                
            }*/
            
        }
    }
    
    
    
}
