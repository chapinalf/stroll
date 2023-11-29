//
//  LocationManager.swift
//  stroll
//
//  Created by Chapin Alf on 11/22/23.
//

import Foundation
import CoreLocation

//MARK: setting up location manager delegate...
extension JourneyViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        //MARK: setting up location manager to get the current location...
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //MARK: if the user either allows location while using the app or always...
        if manager.authorizationStatus == .authorizedWhenInUse
            || manager.authorizationStatus == .authorizedAlways{
            manager.requestLocation()
            onButtonCurrentLocationTapped()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            journeyView.buttonLoading.isHidden = true
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error: \(error.localizedDescription)")
    }
}

