//
//  JourneyViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class JourneyViewController: UIViewController {
    let journeyView = JourneyView()
    
    let locationManager = CLLocationManager()
    
    var place:Place!
    
    let database = Firestore.firestore()
    
    var miles = 0.0
    
    var user:User!
    
    override func loadView() {
        view = journeyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Journey"
        
        getUser()
        
        journeyView.buttonCurrentLocation.addTarget(self, action: #selector(onButtonCurrentLocationTapped), for: .touchUpInside)
        
        journeyView.buttonNavigate.addTarget(self, action: #selector(onButtonNavigateTapped), for: .touchUpInside)
        
        journeyView.buttonCheckIn.addTarget(self, action: #selector(onButtonCheckInTapped), for: .touchUpInside)
        
        journeyView.mapView.showsUserLocation = true
        
    }
    
    func getUser() {
        if let email = Auth.auth().currentUser?.email {
            database.collection("users").document(email).addSnapshotListener { documentSnapshot, error in
                if let document = documentSnapshot {
                    do{
                        self.user = try document.data(as: User.self)
                        self.setTodaysLocation()
                    }catch{
                        print(error)
                        self.showErrorAlert("Could not load location!", "The location could not be loaded. Please try again later!")
                    }
                }
            }
        }
    }

    func setTodaysLocation() {
        let docRef = database.collection("locations").document(user.city).collection("Places").document(getCurrentDate())
        docRef.getDocument(completion: { (document, error) in
            if let document = document, document.exists {
                do{
                    let location = try document.data(as: Location.self)
                    self.place = Place(
                        title: location.name,
                        coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude),
                        info: location.info)
                    self.setupLocationManager()
                    self.journeyView.mapView.addAnnotation(self.place)
                    self.journeyView.mapView.delegate = self
                }catch{
                    self.showErrorAlert("Could not load location!", "The location could not be loaded. Please try again later!")
                }
            }
        })
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
            
            if distance <= 4 { //in meters
                if(user.lastStrollDate != getCurrentDate()){
                    showErrorAlert("Checked in", "You have been checked in!")
                    checkInFirebase()
                } else {
                    showErrorAlert("You have already checked in.", "Complete you next stroll tomorrow!")
                }
            } else {
                showErrorAlert("Not checked in", "You are not at the target location.")
            }
        } else {
            showErrorAlert("Your location is needed!", "Please share your location with the app and try again!")
        }
    }
    
    func checkInFirebase() {
        if(user.lastStrollDate == getYesterdaysDate()){
            database.collection("users").document((Auth.auth().currentUser?.email)!).updateData([
              "strollsStreak": FieldValue.increment(Int64(1)),
              "strollsTotal": FieldValue.increment(Int64(1)),
              "milesStreak": FieldValue.increment(miles),
              "milesTotal": FieldValue.increment(miles),
              "lastStrollDate": getCurrentDate(),
            ])
        } else {
            database.collection("users").document((Auth.auth().currentUser?.email)!).updateData([
              "strollsStreak": 0,
              "strollsTotal": FieldValue.increment(Int64(1)),
              "milesStreak": 0.0,
              "milesTotal": FieldValue.increment(miles),
              "lastStrollDate": getCurrentDate(),
            ])
        }
        
        let docRef = database.collection("locations").document(user.city).collection("Places").document(getCurrentDate()).collection("users")
        docRef.document(user.id!).setData([
            "user": database.collection("users").document(user.id!),
        ]) { err in
          if let err = err {
              self.showErrorAlert("Not checked in", "You could not be checked in. Please try again later!")
            print("Error writing document: \(err)")
          }
        }
    }

    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func getCurrentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
    }
    
    func getYesterdaysDate() -> String {
        let yesterday = Date(timeIntervalSinceNow: -86400)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: yesterday)
        return formattedDate
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
