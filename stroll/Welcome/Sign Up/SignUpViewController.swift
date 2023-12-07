//
//  SignUpViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import PhotosUI
import FirebaseStorage

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    let database = Firestore.firestore()
    var pickedImage:UIImage?
    let storage = Storage.storage()
    let childProgressView = ProgressSpinnerViewController()
    
    var userPhoneNumber: Int!
    var userCity: String!
    
    var selectedCity = "Boston"
    
    
    //MARK: load the view...
    override func loadView() {
        view = signUpView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        signUpView.profilePic.menu = getMenuImagePicker()
        signUpView.cityPicker.menu = getMenuCityPicker()
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSignUpTapped(){
        //MARK: creating a new user on Firebase...
        showActivityIndicator()
        uploadProfilePhotoToStorage()
    }
    
    //MARK: hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func getMenuCityPicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Boston",handler: {(_) in
                self.pickBoston()
            }),
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    func pickBoston()
    {
        selectedCity = "Boston"
        signUpView.cityPicker.setTitle("Boston", for: .normal)
    }
    
}
