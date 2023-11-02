//
//  ProfileView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ProfileView: UIView {
    var profilePic: UIImageView!
    var labelText: UILabel!
    var floatingButtonAddContact: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupProfilePic()
        setupLabelText()
        setupFloatingButtonAddContact()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profilePic)
    }
    
    func setupLabelText(){

    }
    
    func setupFloatingButtonAddContact(){

    }
    
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
