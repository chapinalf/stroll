//
//  ProfileView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ProfileView: UIView {
    var profilePic: UIImageView!
    var profileInfoContainer: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhoneNumber: UILabel!
    //Miles completed in streak
    //Total miles completed
    //Streak
    //Total strolls completed
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupProfileInfoContainer()
        setupProfilePic()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneNumber()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setupProfileInfoContainer() {
        profileInfoContainer = UIView()
        profileInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileInfoContainer)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "First LastName"
        labelName.textColor = UIColor.black
        labelName.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "first.last@gmail.com"
        labelEmail.textColor = UIColor.black
        labelEmail.font = UIFont.systemFont(ofSize: 22.0)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelEmail)
    }
    
    func setupLabelPhoneNumber(){
        labelPhoneNumber = UILabel()
        labelPhoneNumber.text = "5618007865"
        labelPhoneNumber.textColor = UIColor.black
        labelPhoneNumber.font = UIFont.systemFont(ofSize: 22.0)
        labelPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelPhoneNumber)
    }
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 100),
            profilePic.heightAnchor.constraint(equalToConstant: 100),
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            
            profileInfoContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileInfoContainer.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor),
            
            labelName.topAnchor.constraint(equalTo: profileInfoContainer.topAnchor),
            labelName.leadingAnchor.constraint(equalTo: profileInfoContainer.leadingAnchor),
            labelName.trailingAnchor.constraint(equalTo: profileInfoContainer.trailingAnchor),
            labelName.centerXAnchor.constraint(equalTo: profileInfoContainer.centerXAnchor),

            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            labelEmail.leadingAnchor.constraint(equalTo: profileInfoContainer.leadingAnchor),
            labelEmail.trailingAnchor.constraint(equalTo: profileInfoContainer.trailingAnchor),
            labelEmail.centerXAnchor.constraint(equalTo: profileInfoContainer.centerXAnchor),

            labelPhoneNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            labelPhoneNumber.leadingAnchor.constraint(equalTo: profileInfoContainer.leadingAnchor),
            labelPhoneNumber.trailingAnchor.constraint(equalTo: profileInfoContainer.trailingAnchor),
            labelPhoneNumber.centerXAnchor.constraint(equalTo: profileInfoContainer.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
