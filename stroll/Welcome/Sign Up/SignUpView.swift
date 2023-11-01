//
//  SignUpView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class SignUpView: UIView {
    
    var imageLogo: UIImageView!
    var labelSignUp: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var textFieldPassword: UITextField!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        
        //MARK: initializing the UI elements and constraints...
        setupImageLogo()
        setupLabelSignUp()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupTextFieldPassword()
        setupButtonSignUp()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupImageLogo(){
        imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logo")
        imageLogo.contentMode = .scaleToFill
        imageLogo.clipsToBounds = true
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageLogo)
    }
    
    func setupLabelSignUp(){
        labelSignUp = UILabel()
        labelSignUp.text = "Enter your information to sign up:"
        labelSignUp.textColor = UIColor.black
        labelSignUp.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSignUp)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email Address"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone Number"
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhoneNumber)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.backgroundColor = .white
        buttonSignUp.setTitleColor(.black, for: .normal)
        buttonSignUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonSignUp.layer.cornerRadius = 10
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            //4860 × 1606 / 15
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: 324),
            imageLogo.heightAnchor.constraint(equalToConstant: 107.07),
            imageLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelSignUp.topAnchor.constraint(equalTo: imageLogo.bottomAnchor),
            labelSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelSignUp.bottomAnchor, constant: 10),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 5),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 5),
            textFieldPhoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 5),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            buttonSignUp.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10),
            buttonSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSignUp.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            buttonSignUp.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
        ])
    }
    
}
