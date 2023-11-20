//
//  SignUpFirebaseManager.swift
//  stroll
//
//  Created by Chapin Alf on 11/19/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension SignUpViewController{
    
    //MARK: upload photo to the storage in firebase...
    func uploadProfilePhotoToStorage(){
        var profilePhotoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80){
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesUsers")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil{
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil{
                                profilePhotoURL = url
                                self.signUpUser(photoURL: profilePhotoURL)
                            } else {
                                self.showErrorAlert("Sign Up Failed!", "The image could not be uploaded. Please try again.")
                                self.hideActivityIndicator()
                            }
                        })
                    }else {
                        self.hideActivityIndicator()
                        print(error?.localizedDescription)
                        self.showErrorAlert("Sign Up Failed!", "The image could not be uploaded. Please try again.")
                    }
                })
            }
        }else{
            signUpUser(photoURL: profilePhotoURL)
        }
    }

    
    //MARK: check inputs and signup the user...
    func signUpUser(photoURL: URL?){
        //MARK: unwrap inputs...
        if let name = signUpView.textFieldName.text,
           let email = signUpView.textFieldEmail.text,
           let phoneNumberString = signUpView.textFieldPhoneNumber.text,
           let city = signUpView.textFieldCity.text,
           let password = signUpView.textFieldPassword.text,
           let passwordConfirm = signUpView.textFieldPasswordConfirm.text{
            
            //MARK: check inputs...
            if name.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "A name must be provided. Please try again!")
                self.hideActivityIndicator()
            } else if email.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "An email must be provided. Please try again!")
                self.hideActivityIndicator()
            } else if phoneNumberString.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "A phone number must be provided. Please try again!")
                self.hideActivityIndicator()
            } else if phoneNumberString.count != 10 {
                self.showErrorAlert("Sign Up Failed!", "The provided phone number must be 10 digits! Please try again!")
                self.hideActivityIndicator()
            } else if city.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "The city which you are located in must be provided. Please try again!")
                self.hideActivityIndicator()
            } else if password.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "A password must be provided. Please try again!")
                self.hideActivityIndicator()
            } else if passwordConfirm.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "The password must be confirmed. Please try again!")
                self.hideActivityIndicator()
            } else if password != passwordConfirm {
                self.showErrorAlert("Sign Up Failed!", "The password fields do not match. Please try again!")
                self.hideActivityIndicator()
            } else {
                if let phoneNumber = Int(phoneNumberString) {
                    userPhoneNumber = phoneNumber
                    userCity = city
                    
                    //MARK: create the user in firebase...
                    Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                        if error != nil{
                            self.hideActivityIndicator()
                            self.showErrorAlert("Sign Up Failed!", (String(describing: error!.localizedDescription)) + " Please try again!")
                            print("Error occured: \(String(describing: error))")
                        } else {
                            self.setNameAndPhotoOfTheUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
                        }
                    })
                } else {
                    self.showErrorAlert("Sign Up Failed!", "The provided phone number must be only digits! Please try again!")
                    self.hideActivityIndicator()
                }
            }
        } else {
            self.showErrorAlert("Sign Up Failed!", "The inputs provided were not valid. Please try again!")
            self.hideActivityIndicator()
        }
    }
    
    //MARK: set the name and photo of the user in firebase...
    func setNameAndPhotoOfTheUserInFirebaseAuth(name: String, email: String, photoURL: URL?){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        
        changeRequest?.commitChanges(completion: {(error) in
            if error != nil{
                self.hideActivityIndicator()
                self.showErrorAlert("Sign Up Failed!", (String(describing: error!.localizedDescription)) + " Please try again!")
            }else{
                self.saveUserToFireStore()
            }
        })
    }
    
    func saveUserToFireStore(){
        if let userName = Auth.auth().currentUser?.displayName, let userEmail = Auth.auth().currentUser?.email{
            let collectionContacts = database
                .collection("users")
            
            let user = User(name: userName, phoneNumber: userPhoneNumber, city: userCity, strollsTotal: 0, strollsStreak: 0, milesTotal: 0, milesStreak: 0)
            
            do{
                try collectionContacts.document(userEmail).setData(from: user, completion: {(error) in
                    if error == nil{
                        self.hideActivityIndicator()
                        self.dismiss(animated: true)
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    }
    
}

