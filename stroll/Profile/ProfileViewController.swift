//
//  ProfileViewController.swift
//  stroll
//
//  Created by Chapin Alf on 10/30/23.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    let defaults = UserDefaults.standard
    
    //MARK: load the view...
    override func loadView() {
        view = profileView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        // MARK: Setting the edit profile button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onHamburgerTapped))
        
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "line.3.horizontal")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func onHamburgerTapped() {
        let hamburgerAlert = UIAlertController()
        
        let editProfileViewController = EditProfileViewController()
        //MARK: add edit action...
        let editAction = UIAlertAction(title: "Edit Profile", style: .default) { (action) in
            self.navigationController?.pushViewController(editProfileViewController, animated: true)
        }
        hamburgerAlert.addAction(editAction)

        //MARK: add sign out action...
        let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive) { (action) in
            self.defaults.removeObject(forKey: "apiKey")
            print("API Key removed")
            let welcome = UINavigationController(rootViewController: WelcomeViewController())
            welcome.modalPresentationStyle = .fullScreen
            self.present(welcome, animated: true, completion: nil)
        }
        hamburgerAlert.addAction(signOutAction)

        //MARK: add cancel action...
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        hamburgerAlert.addAction(cancelAction)

        self.present(hamburgerAlert, animated: true)
    }

}
