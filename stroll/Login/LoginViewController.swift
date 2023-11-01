//
//  LoginViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let defaults = UserDefaults.standard
    
    //MARK: load the view...
    override func loadView() {
        view = loginView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
    }
    
    //MARK: login button tapped...
    @objc func onButtonLoginTapped(){
        self.defaults.set("1", forKey: "apiKey")
    }

}
