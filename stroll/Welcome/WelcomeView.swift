//
//  WelcomeView.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class WelcomeView: UIView {
    
    var container: UIView!
    var imageLogo: UIImageView!
    var buttonLogin: UIButton!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = UIColor(red: 109/255, green: 205/255, blue: 255/255, alpha: 1)
        
        //MARK: initializing the UI elements and constraints...
        setupContainer()
        setupImageLogo()
        setupButtonLogin()
        setupButtonSignUp()
        initConstraints()
    }

    //MARK: initializing the UI elements...
    func setupContainer(){
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(container)
    }
    
    func setupImageLogo(){
        imageLogo = UIImageView()
        imageLogo.image = UIImage(named: "logo")
        imageLogo.contentMode = .scaleToFill
        imageLogo.clipsToBounds = true
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageLogo)
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
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            //4860 × 1606 / 15
            imageLogo.widthAnchor.constraint(equalToConstant: 324),
            imageLogo.heightAnchor.constraint(equalToConstant: 107.07),
            imageLogo.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageLogo.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -40),
            
            buttonLogin.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 20),
            buttonLogin.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalTo: imageLogo.widthAnchor),
            
            buttonSignUp.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            buttonSignUp.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            buttonSignUp.widthAnchor.constraint(equalTo: imageLogo.widthAnchor),
        ])
    }
    
}


