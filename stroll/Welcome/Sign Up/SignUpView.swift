//
//  SignUpView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class SignUpView: UIView {

    var labelSignUp: UILabel!
    var profilePic: UIButton!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var cityPicker: UIButton!
    var textFieldPassword: UITextField!
    var textFieldPasswordConfirm: UITextField!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        
        //MARK: initializing the UI elements and constraints...
        setupLabelSignUp()
        setupProfilePic()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupCityPicker()
        setupTextFieldPassword()
        setupTextFieldPasswordConfirm()
        setupButtonSignUp()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelSignUp(){
        labelSignUp = UILabel()
        labelSignUp.text = "Enter your information to sign up:"
        labelSignUp.textColor = UIColor.black
        labelSignUp.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSignUp)
    }
    
    func setupProfilePic(){
        profilePic = UIButton(type: .system)
        profilePic.setTitle("", for: .normal)
        profilePic.setImage(UIImage(systemName: "person.fill.badge.plus")?.withRenderingMode(.alwaysOriginal).withTintColor(.black), for: .normal)
        profilePic.contentHorizontalAlignment = .fill
        profilePic.contentVerticalAlignment = .fill
        profilePic.imageView?.contentMode = .scaleAspectFit
        profilePic.showsMenuAsPrimaryAction = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
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
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPhoneNumber(){
        textFieldPhoneNumber = UITextField()
        textFieldPhoneNumber.placeholder = "Phone Number"
        textFieldPhoneNumber.borderStyle = .roundedRect
        textFieldPhoneNumber.keyboardType = .numberPad
        textFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhoneNumber)
    }
    
    func setupCityPicker(){
        cityPicker = UIButton(type: .system)
        cityPicker.setTitle("Choose your city!", for: .normal)
        cityPicker.backgroundColor = .white
        cityPicker.setTitleColor(.black, for: .normal)
        cityPicker.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cityPicker.layer.cornerRadius = 10
        cityPicker.translatesAutoresizingMaskIntoConstraints = false
        cityPicker.showsMenuAsPrimaryAction = true
        self.addSubview(cityPicker)
        
        }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.textContentType = .password
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupTextFieldPasswordConfirm(){
        textFieldPasswordConfirm = UITextField()
        textFieldPasswordConfirm.placeholder = "Password Confirmation"
        textFieldPasswordConfirm.borderStyle = .roundedRect
        textFieldPasswordConfirm.textContentType = .password
        textFieldPasswordConfirm.isSecureTextEntry = true
        textFieldPasswordConfirm.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPasswordConfirm)
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
            labelSignUp.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            profilePic.widthAnchor.constraint(equalToConstant: 100),
            profilePic.heightAnchor.constraint(equalToConstant: 100),
            profilePic.topAnchor.constraint(equalTo: labelSignUp.bottomAnchor, constant: 8),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 10),
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
            
            cityPicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            cityPicker.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 5),
            cityPicker.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            cityPicker.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: cityPicker.bottomAnchor, constant: 5),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldPasswordConfirm.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 5),
            textFieldPasswordConfirm.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPasswordConfirm.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldPasswordConfirm.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            buttonSignUp.topAnchor.constraint(equalTo: textFieldPasswordConfirm.bottomAnchor, constant: 10),
            buttonSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSignUp.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            buttonSignUp.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
        ])
    }
    
}
