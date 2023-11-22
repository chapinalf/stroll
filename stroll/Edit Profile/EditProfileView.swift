//
//  EditProfileView.swift
//  stroll
//
//  Created by Chapin Alf on 11/2/23.
//

import UIKit

class EditProfileView: UIView {

    var labelEdit: UILabel!
    var profilePic: UIButton!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var textFieldCity: UITextField! //TODO: CHANGE TO DROPDOWN
    var textFieldPassword: UITextField!
    var textFieldPasswordConfirm: UITextField!
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabelEdit()
        setupProfilePic()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPhoneNumber()
        setupTextFieldCity()
        setupTextFieldPassword()
        setupTextFieldPasswordConfirm()
        setupButtonSave()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelEdit(){
        labelEdit = UILabel()
        labelEdit.text = "Edit your profile information:"
        labelEdit.textColor = UIColor.black
        labelEdit.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelEdit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEdit)
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
    
    func setupTextFieldCity(){
        textFieldCity = UITextField()
        textFieldCity.placeholder = "City"
        textFieldCity.borderStyle = .roundedRect
        textFieldCity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCity)
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
    
    func setupButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = .white
        buttonSave.setTitleColor(.black, for: .normal)
        buttonSave.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonSave.layer.cornerRadius = 10
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelEdit.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelEdit.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            profilePic.widthAnchor.constraint(equalToConstant: 100),
            profilePic.heightAnchor.constraint(equalToConstant: 100),
            profilePic.topAnchor.constraint(equalTo: labelEdit.bottomAnchor, constant: 8),
            profilePic.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 10),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 5),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
            
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 5),
            textFieldPhoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
            
            textFieldCity.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 5),
            textFieldCity.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldCity.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            textFieldCity.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldCity.bottomAnchor, constant: 5),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
            
            textFieldPasswordConfirm.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 5),
            textFieldPasswordConfirm.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPasswordConfirm.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            textFieldPasswordConfirm.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldPasswordConfirm.bottomAnchor, constant: 10),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSave.leadingAnchor.constraint(equalTo: labelEdit.leadingAnchor),
            buttonSave.trailingAnchor.constraint(equalTo: labelEdit.trailingAnchor),
        ])
    }
    
}

