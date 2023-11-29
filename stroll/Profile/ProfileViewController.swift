//
//  ProfileViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

//TODO: ADD PROGRESS INDICATOR
class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    let database = Firestore.firestore()
    
    //MARK: load the view...
    override func loadView() {
        view = profileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.profileView.labelName.text = Auth.auth().currentUser?.displayName
        self.profileView.labelEmail.text = "Email: " + (Auth.auth().currentUser?.email)!
        
        //MARK: observe firestore database to display the profile information...
        database.collection("users").document((Auth.auth().currentUser?.email)!).addSnapshotListener { documentSnapshot, error in
              
              if let document = documentSnapshot {
                      do{
                          let user = try document.data(as: User.self)
                          self.profileView.labelPhoneNumber.text = "Phone: " + String(user.phoneNumber)
                          self.profileView.labelCity.text = "City: " + user.city
                          self.profileView.labelStrollsStreak1.text = String(user.strollsStreak)
                          self.profileView.labelStrollsTotal1.text = String(user.strollsTotal)
                          self.profileView.labelMilesStreak1.text = String(user.milesStreak)
                          self.profileView.labelMilesTotal1.text = String(user.milesTotal)
                      }catch{
                          print(error)
                          self.showErrorAlert("Could not load profile!", "The profile could not be loaded. Please try again later!")
                      }
                  }
          }
        
        //MARK: setting the profile photo...
        if let url = Auth.auth().currentUser?.photoURL{
            self.profileView.profilePic.loadRemoteImage(from: url)
        } else {
            self.profileView.profilePic.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        }
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        // MARK: Setting the edit profile button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onHamburgerTapped))
        
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "line.3.horizontal")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func onHamburgerTapped() {
        let hamburgerAlert = UIAlertController()

        //MARK: add sign out action...
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (action) in
            
            do{
                try Auth.auth().signOut()
            }catch{
                self.showErrorAlert("Sign out Failed!", "You could not be signed out. Please try again!")
            }
            
        }
        hamburgerAlert.addAction(signOutAction)

        //MARK: add cancel action...
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        hamburgerAlert.addAction(cancelAction)

        self.present(hamburgerAlert, animated: true)
    }
    
    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

}
