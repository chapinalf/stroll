//
//  JourneyViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit
import MapKit

class JourneyViewController: UIViewController {
    let journeyView = JourneyView()
    
    let locationManager = CLLocationManager()
    
    override func loadView() {
        view = journeyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Journey"
        
        setupLocationManager()
        
        //MARK: center the map view to current location when the app loads...
        if locationManager.authorizationStatus == .authorizedWhenInUse
            || locationManager.authorizationStatus == .authorizedAlways{
            onButtonCurrentLocationTapped()
        }
        
        //MARK: Annotating Northeastern University...
        let northeastern = Place(
            title: "Northeastern University",
            coordinate: CLLocationCoordinate2D(latitude: 42.339918, longitude: -71.089797),
            info: "LVX VERITAS VIRTVS"
        )
        
        journeyView.mapView.addAnnotation(northeastern)
        journeyView.mapView.delegate = self
        
        journeyView.buttonCurrentLocation.addTarget(self, action: #selector(onButtonCurrentLocationTapped), for: .touchUpInside)
        
    }
    
    @objc func onButtonCurrentLocationTapped(){
        if let location = locationManager.location {
            journeyView.mapView.centerToLocation(location: location)
        } else {
            showErrorAlert("Your location is needed!", "Please share your location with the app and try again!")
        }
    }

    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}

extension MKMapView{
    func centerToLocation(location: CLLocation, radius: CLLocationDistance = 1000){
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: radius,
            longitudinalMeters: radius
        )
        setRegion(coordinateRegion, animated: true)
    }
}
