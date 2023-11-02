//
//  EditProfileView.swift
//  stroll
//
//  Created by Chapin Alf on 11/2/23.
//

import UIKit

class EditProfileView: UIView {
    
    var labelEdit: UILabel!
    var profilePic: UIImageView!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPhoneNumber: UITextField!
    var textFieldPassword: UITextField!
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
        setupTextFieldPassword()
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
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.fill.badge.plus")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
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
    
    func setupButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
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
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 5),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            textFieldPhoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 5),
            textFieldPhoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldPhoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldPhoneNumber.bottomAnchor, constant: 5),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 10),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSave.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            buttonSave.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
    }
    
}

