//
//  EditProfileViewController.swift
//  stroll
//
//  Created by Chapin Alf on 11/2/23.
//

import UIKit

class EditProfileViewController: UIViewController {

    let editProfileView = EditProfileView()
    
    //MARK: load the view...
    override func loadView() {
        view = editProfileView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileView.buttonSave.addTarget(self, action: #selector(onButtonSaveTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSaveTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }

}
