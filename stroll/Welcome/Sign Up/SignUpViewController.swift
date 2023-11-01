//
//  SignUpViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    
    //MARK: load the view...
    override func loadView() {
        view = signUpView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSignUpTapped(){
//        let signupViewController = SignUpViewController()
//        navigationController?.pushViewController(signupViewController, animated: true)
    }

}
