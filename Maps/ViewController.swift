//
//  ViewController.swift
//  Maps
//
//  Created by Jamario Davis on 7/21/20.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // distanceFilter controls how frequent you want updates to be.
        locationManager.distanceFilter = 0.0
   
        // Request permission for user's location
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
        let bahaMarAnnotation = LocationAnnotation(title: "Baha Mar", coordinate: CLLocationCoordinate2D(latitude: 25.0706, longitude: -77.3967))
        mapView.addAnnotation(bahaMarAnnotation)
        mapView.setCenter(bahaMarAnnotation.coordinate, animated: false)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        print("location update latitude: \(location.coordinate.latitude) , longitude: \(location.coordinate.longitude)")
    }
}
