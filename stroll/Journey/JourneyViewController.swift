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
    
    var place:Place!
    
    override func loadView() {
        view = journeyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Journey"
        
        setupLocationManager()
        
        //MARK: Annotating Northeastern University...
        place = Place(
            title: "Northeastern University",
            coordinate: CLLocationCoordinate2D(latitude: 42.339918, longitude: -71.089797),
            info: "LVX VERITAS VIRTVS"
        )
        
        journeyView.mapView.addAnnotation(place)
        journeyView.mapView.delegate = self
        
        journeyView.buttonCurrentLocation.addTarget(self, action: #selector(onButtonCurrentLocationTapped), for: .touchUpInside)
        
        journeyView.buttonNavigate.addTarget(self, action: #selector(onButtonNavigateTapped), for: .touchUpInside)
        
        journeyView.buttonCheckIn.addTarget(self, action: #selector(onButtonCheckInTapped), for: .touchUpInside)
        
        journeyView.mapView.showsUserLocation = true
        
    }
    
    @objc func onButtonCurrentLocationTapped(){
        if let location = locationManager.location {
            journeyView.mapView.centerToLocation(location: location)
        } else {
            showErrorAlert("Your location is needed!", "Please share your location with the app and try again!")
        }
    }
    
    @objc func onButtonNavigateTapped(){
        let ac = UIAlertController(
            title:  "Navigate now?",
            message: "You will be brought to the Maps app to navigate you to \(place.title!). Do not forget to come back and check in once you arrive!",
            preferredStyle: .alert
        )
        ac.addAction(UIAlertAction(title: "Navigate", style: .default, handler: {_ in
            let launchOptions = [
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
            ]
            self.place.mapItem?.openInMaps(launchOptions: launchOptions)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func onButtonCheckInTapped(){
        if let location = locationManager.location {
            let placeLocation = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
            let distance = location.distance(from: placeLocation)
            
            if distance <= 3 {
                print("User is at the target location.")
            } else {
                print("User is not at the target location.")
            }
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
