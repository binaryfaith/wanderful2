//
//  ViewController.swift
//  wanderful2
//
//  Created by David on 11/12/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    lazy var mapView = GMSMapView()

    override func viewDidLoad() {
        super.viewDidLoad()


        // Create a GMSCameraPosition that tells the map to display the
        let camera = GMSCameraPosition.camera(withLatitude: 37.621262, longitude: -122.378945, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.621262, longitude: -122.378945)
        marker.title = "SFO Airport"
        marker.icon = UIImage(named: "rebel")
        marker.snippet = "San Francisco"
        marker.map = mapView
        
        //Custom Marker
        let markerRebel = GMSMarker()
        markerRebel.position = CLLocationCoordinate2D(latitude: 37.621262, longitude: -122.378945)
        markerRebel.title = "rebel"
        markerRebel.snippet = "Space Port"
        markerRebel.map = mapView
        markerRebel.icon = UIImage(named: "rebel")
        
        // User Location
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        _ = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                              longitude: userLocation!.coordinate.longitude, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        locationManager.stopUpdatingLocation()
    }
    
    


}

