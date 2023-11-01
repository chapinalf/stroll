//
//  WelcomeViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    let welcomeView = WelcomeView()
    
    //MARK: load the view...
    override func loadView() {
        view = welcomeView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        welcomeView.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        welcomeView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
    }
    
    //MARK: login button tapped...
    @objc func onButtonLoginTapped(){
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSignUpTapped(){
        let signupViewController = SignUpViewController()
        navigationController?.pushViewController(signupViewController, animated: true)
    }

}
