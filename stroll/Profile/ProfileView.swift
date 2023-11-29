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
    var labelCity: UILabel!
    
    var strollsStreakContainer: UIView!
    var labelStrollsStreak1: UILabel!
    var labelStrollsStreak2: UILabel!
    
    var strollsTotalContainer: UIView!
    var labelStrollsTotal1: UILabel!
    var labelStrollsTotal2: UILabel!
    
    var milesStreakContainer: UIView!
    var labelMilesStreak1: UILabel!
    var labelMilesStreak2: UILabel!
    
    var milesTotalContainer: UIView!
    var labelMilesTotal1: UILabel!
    var labelMilesTotal2: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupProfileInfoContainer()
        setupProfilePic()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneNumber()
        setupLabelCity()
        setupStrollsStreak()
        setupStrollsTotal()
        setupMilesStreak()
        setupMilesTotal()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupProfilePic(){
        profilePic = UIImageView()
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
        labelName.textColor = UIColor.black
        labelName.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.textColor = UIColor.black
        labelEmail.font = UIFont.systemFont(ofSize: 18)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelEmail)
    }
    
    func setupLabelPhoneNumber(){
        labelPhoneNumber = UILabel()
        labelPhoneNumber.textColor = UIColor.black
        labelPhoneNumber.font = UIFont.systemFont(ofSize: 18)
        labelPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelPhoneNumber)
    }
    
    func setupLabelCity(){
        labelCity = UILabel()
        labelCity.textColor = UIColor.black
        labelCity.font = UIFont.systemFont(ofSize: 18)
        labelCity.translatesAutoresizingMaskIntoConstraints = false
        profileInfoContainer.addSubview(labelCity)
    }
    
    func setupStrollsStreak() {
        strollsStreakContainer = UIView()
        strollsStreakContainer.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        strollsStreakContainer.layer.cornerRadius = 10
        strollsStreakContainer.clipsToBounds = true
        strollsStreakContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(strollsStreakContainer)
        
        labelStrollsStreak1 = UILabel()
        labelStrollsStreak1.textAlignment = .center
        labelStrollsStreak1.textColor = UIColor.black
        labelStrollsStreak1.font = UIFont.boldSystemFont(ofSize: 50)
        labelStrollsStreak1.translatesAutoresizingMaskIntoConstraints = false
        strollsStreakContainer.addSubview(labelStrollsStreak1)
        
        
        labelStrollsStreak2 = UILabel()
        labelStrollsStreak2.text = "Strolls Streak"
        labelStrollsStreak2.textAlignment = .center
        labelStrollsStreak2.textColor = UIColor.black
        labelStrollsStreak2.font = UIFont.systemFont(ofSize: 18)
        labelStrollsStreak2.translatesAutoresizingMaskIntoConstraints = false
        strollsStreakContainer.addSubview(labelStrollsStreak2)
    }
    
    func setupStrollsTotal() {
        strollsTotalContainer = UIView()
        strollsTotalContainer.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        strollsTotalContainer.layer.cornerRadius = 10
        strollsTotalContainer.clipsToBounds = true
        strollsTotalContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(strollsTotalContainer)
        
        labelStrollsTotal1 = UILabel()
        labelStrollsTotal1.textAlignment = .center
        labelStrollsTotal1.textColor = UIColor.black
        labelStrollsTotal1.font = UIFont.boldSystemFont(ofSize: 50)
        labelStrollsTotal1.translatesAutoresizingMaskIntoConstraints = false
        strollsTotalContainer.addSubview(labelStrollsTotal1)
        
        labelStrollsTotal2 = UILabel()
        labelStrollsTotal2.text = "Total Strolls"
        labelStrollsTotal2.textAlignment = .center
        labelStrollsTotal2.textColor = UIColor.black
        labelStrollsTotal2.font = UIFont.systemFont(ofSize: 18)
        labelStrollsTotal2.translatesAutoresizingMaskIntoConstraints = false
        strollsTotalContainer.addSubview(labelStrollsTotal2)
    }
    
    func setupMilesStreak() {
        milesStreakContainer = UIView()
        milesStreakContainer.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        milesStreakContainer.layer.cornerRadius = 10
        milesStreakContainer.clipsToBounds = true
        milesStreakContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(milesStreakContainer)
        
        labelMilesStreak1 = UILabel()
        labelMilesStreak1.textAlignment = .center
        labelMilesStreak1.textColor = UIColor.black
        labelMilesStreak1.font = UIFont.boldSystemFont(ofSize: 50)
        labelMilesStreak1.translatesAutoresizingMaskIntoConstraints = false
        milesStreakContainer.addSubview(labelMilesStreak1)
        
        
        labelMilesStreak2 = UILabel()
        labelMilesStreak2.text = "Miles in Streak"
        labelMilesStreak2.textAlignment = .center
        labelMilesStreak2.textColor = UIColor.black
        labelMilesStreak2.font = UIFont.systemFont(ofSize: 18)
        labelMilesStreak2.translatesAutoresizingMaskIntoConstraints = false
        milesStreakContainer.addSubview(labelMilesStreak2)
    }
    
    func setupMilesTotal() {
        milesTotalContainer = UIView()
        milesTotalContainer.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        milesTotalContainer.layer.cornerRadius = 10
        milesTotalContainer.clipsToBounds = true
        milesTotalContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(milesTotalContainer)
        
        labelMilesTotal1 = UILabel()
        labelMilesTotal1.textAlignment = .center
        labelMilesTotal1.textColor = UIColor.black
        labelMilesTotal1.font = UIFont.boldSystemFont(ofSize: 50)
        labelMilesTotal1.translatesAutoresizingMaskIntoConstraints = false
        milesTotalContainer.addSubview(labelMilesTotal1)
        
        
        labelMilesTotal2 = UILabel()
        labelMilesTotal2.text = "Total Miles"
        labelMilesTotal2.textAlignment = .center
        labelMilesTotal2.textColor = UIColor.black
        labelMilesTotal2.font = UIFont.systemFont(ofSize: 18)
        labelMilesTotal2.translatesAutoresizingMaskIntoConstraints = false
        milesTotalContainer.addSubview(labelMilesTotal2)
    }
    
    //MARK: setting up constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            profilePic.widthAnchor.constraint(equalToConstant: 100),
            profilePic.heightAnchor.constraint(equalToConstant: 100),
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            profileInfoContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            profileInfoContainer.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor),
            
            labelName.topAnchor.constraint(equalTo: profileInfoContainer.topAnchor),
            labelName.leadingAnchor.constraint(equalTo: profileInfoContainer.leadingAnchor, constant: 20),

            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),

            labelPhoneNumber.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhoneNumber.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            
            labelCity.topAnchor.constraint(equalTo: labelPhoneNumber.bottomAnchor, constant: 4),
            labelCity.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            
            strollsStreakContainer.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 20),
            strollsStreakContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            strollsStreakContainer.widthAnchor.constraint(equalToConstant: 170),
            strollsStreakContainer.heightAnchor.constraint(equalToConstant: 98),
            
            labelStrollsStreak1.centerXAnchor.constraint(equalTo: strollsStreakContainer.centerXAnchor),
            labelStrollsStreak1.topAnchor.constraint(equalTo: strollsStreakContainer.topAnchor, constant: 5),
            
            labelStrollsStreak2.centerXAnchor.constraint(equalTo: strollsStreakContainer.centerXAnchor),
            labelStrollsStreak2.topAnchor.constraint(equalTo: labelStrollsStreak1.bottomAnchor),
            
            strollsTotalContainer.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 20),
            strollsTotalContainer.leadingAnchor.constraint(equalTo: strollsStreakContainer.trailingAnchor, constant: 20),
            strollsTotalContainer.widthAnchor.constraint(equalToConstant: 170),
            strollsTotalContainer.heightAnchor.constraint(equalToConstant: 98),
            
            labelStrollsTotal1.centerXAnchor.constraint(equalTo: strollsTotalContainer.centerXAnchor),
            labelStrollsTotal1.topAnchor.constraint(equalTo: strollsTotalContainer.topAnchor, constant: 5),
            
            labelStrollsTotal2.centerXAnchor.constraint(equalTo: strollsTotalContainer.centerXAnchor),
            labelStrollsTotal2.topAnchor.constraint(equalTo: labelStrollsTotal1.bottomAnchor),
            
            milesStreakContainer.topAnchor.constraint(equalTo: strollsStreakContainer.bottomAnchor, constant: 20),
            milesStreakContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            milesStreakContainer.widthAnchor.constraint(equalToConstant: 170),
            milesStreakContainer.heightAnchor.constraint(equalToConstant: 98),
            
            labelMilesStreak1.centerXAnchor.constraint(equalTo: milesStreakContainer.centerXAnchor),
            labelMilesStreak1.topAnchor.constraint(equalTo: milesStreakContainer.topAnchor, constant: 5),
            
            labelMilesStreak2.centerXAnchor.constraint(equalTo: milesStreakContainer.centerXAnchor),
            labelMilesStreak2.topAnchor.constraint(equalTo: labelMilesStreak1.bottomAnchor),
            
            milesTotalContainer.topAnchor.constraint(equalTo: strollsStreakContainer.bottomAnchor, constant: 20),
            milesTotalContainer.leadingAnchor.constraint(equalTo: milesStreakContainer.trailingAnchor, constant: 20),
            milesTotalContainer.widthAnchor.constraint(equalToConstant: 170),
            milesTotalContainer.heightAnchor.constraint(equalToConstant: 98),
            
            labelMilesTotal1.centerXAnchor.constraint(equalTo: milesTotalContainer.centerXAnchor),
            labelMilesTotal1.topAnchor.constraint(equalTo: milesTotalContainer.topAnchor, constant: 5),
            
            labelMilesTotal2.centerXAnchor.constraint(equalTo: milesTotalContainer.centerXAnchor),
            labelMilesTotal2.topAnchor.constraint(equalTo: labelMilesTotal1.bottomAnchor),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
