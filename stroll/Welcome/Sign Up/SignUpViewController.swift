//
//  SignUpViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    
    //MARK: Load the view
    override func loadView() {
        view = signUpView
    }

    //MARK: Do on load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Sign Up"
    }
    
    //TODO: Implement view controller functionality

}
