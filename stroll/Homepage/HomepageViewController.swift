//
//  HomepageViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/31/23.
//

import UIKit
import MapKit
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseStorage

class HomepageViewController: UIViewController {

    let homepageView = HomepageView()
    
    let database = Firestore.firestore()

    var completedUsers = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
        setTodaysLocation()
        setLeaderBoard()
        
        
    }
    
    //MARK: load the view...
    override func loadView() {
        view = homepageView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Today's Location"
        
        homepageView.startButton.addTarget(self, action: #selector(onStartButtonTapped), for: .touchUpInside)

    }
    
    
    
    
    @objc func onStartButtonTapped() {
        if let tabBarController = tabBarController {
            tabBarController.selectedIndex = 1 // Index of the "Journey" tab
        }
    }
    
    //grabs the current date and formattes it properly so we can use it to retreive today's location
    func getCurrentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: currentDate)
        print("FORMATTED DATE: \(formattedDate)")
        return formattedDate
    }
    
    func setTodaysLocation() {
        self.database.collection("locations").document("Boston").collection("Places").document("2023-12-01").addSnapshotListener { documentSnapshot, error in
            if let document = documentSnapshot {
                do{
                    let location = try document.data(as: Location.self)
                    self.homepageView.locationLabel.text =  String(location.name)
                    let httpsReference = Storage.storage().reference(forURL: location.photoURL)
                    
                    httpsReference.getData(maxSize: 1 * 1024 * 1024) {data, error in
                        if let error = error {
                            //error
                        } else {
                            self.homepageView.locationPhoto.image = UIImage(data: data!)
                        }
                        self.homepageView.additionalInformationText.text = location.info
                    }
                    }catch{
                        print("ERROR MESSAGE: \(error)")
                        self.showErrorAlert("Could not load location!", "The location could not be loaded. Please try again later!")
                    }
            }
        }
    }

    
    func setLeaderBoard() {
        // Look into the current date and get all users who completed today's stroll
        self.database.collection("locations").document("Boston").collection("Places").document("2023-12-01").collection("users")
            .addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    print("documents: \(documents)")
                    self.completedUsers.removeAll()

                    // Iterate through all the users
                    for document in documents {
                        do {
                            // Extract the reference field value
                            if let userReference = document["user"] as? DocumentReference {
                                // Use the reference to fetch the user document
                                userReference.getDocument { (userDocument, error) in
                                    if let userDocument = userDocument, userDocument.exists {
                                        let userData = userDocument.data()
                                        if let userName = userData?["name"] as? String {
                                            // Print the name of the user
                                            print("User Name: \(userName)")
                                            self.completedUsers.append(String(userName + " \n"))
                                            print("APPEND: \(self.completedUsers)")
                                            self.homepageView.completedName.text = self.completedUsers
                                        }
                                    } else {
                                        print("Error fetching user document: \(String(describing: error))")
                                    }
                                }
                            }
                        }
                    }
                }
            })
    }


    
    
    
    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}
