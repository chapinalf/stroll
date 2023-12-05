//
//  LocationManagerDelegate.swift
//  stroll
//
//  Created by Chapin Alf on 11/22/23.
//

import Foundation
import MapKit
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            journeyView.buttonLoading.isHidden = true
        }
        
        guard let userLocation = locations.last?.coordinate else { return }
        
        if let uwPlace = place {
            drawRoute(from: userLocation, to: uwPlace.coordinate)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error: \(error.localizedDescription)")
    }
    
    func drawRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        //remove existing overlays before drawing a new route
        journeyView.mapView.removeOverlays(journeyView.mapView.overlays)
        
        let sourcePlacemark = MKPlacemark(coordinate: source, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destination, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { [weak self] (response, error) in
            guard let self = self else { return }
            
            if let route = response?.routes.first {
                let meters = (response?.routes.first?.distance)!
                let milesConverted = meters * 0.000621371
                if (milesConverted > miles) {
                    miles = round(milesConverted * 10) / 10.0
                }
        
                journeyView.mapView.addOverlay(route.polyline, level: .aboveRoads)
                
                // Center the map to show the entire route
                let routeRect = route.polyline.boundingMapRect
                journeyView.mapView.setVisibleMapRect(routeRect, edgePadding: UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0), animated: true)
            } 
//            else {
//                journeyView.buttonRouteNotFound.isHidden = false
//            }
        }
    }
}

