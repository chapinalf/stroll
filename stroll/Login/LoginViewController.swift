//
//  LoginViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    //MARK: Load the view
    override func loadView() {
        view = loginView
    }

    //MARK: Do on load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
    }
    
    //TODO: Implement view controller functionality

}
