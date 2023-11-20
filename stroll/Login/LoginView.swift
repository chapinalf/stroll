//
//  LoginView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class LoginView: UIView {
    
    var labelLogin: UILabel!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var buttonLogin: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        
        //MARK: initializing the UI elements and constraints...
        setupLabelLogin()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonLogin()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelLogin(){
        labelLogin = UILabel()
        labelLogin.text = "Enter your login information:"
        labelLogin.textColor = UIColor.black
        labelLogin.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelLogin)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email Address"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.textContentType = .password
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = .white
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelLogin.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 10),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelLogin.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelLogin.trailingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 5),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelLogin.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelLogin.trailingAnchor),
            
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonLogin.leadingAnchor.constraint(equalTo: labelLogin.leadingAnchor),
            buttonLogin.trailingAnchor.constraint(equalTo: labelLogin.trailingAnchor),
        ])
    }
    
}
